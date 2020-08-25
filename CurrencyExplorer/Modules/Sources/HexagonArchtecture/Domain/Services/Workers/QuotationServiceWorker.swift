import Foundation
import HexagonEdges

///
/// A proxy for CurrencyServiceWorker. Manage the  cache anda bypass requests for CyrrencyServiceWorker
///
class QuotationServiceWorker: QuotationService {
    private enum File: String {
        case quotation = "quotation.json"
        case currencies = "currencies.json"
    }

    private let fileManager: FileManagerServicePort
    private let session: Session
    private let service: CurrencyService
    private let requestTimeSpace: Int
    private var quotation: Quotation?
    private var currencyList: CurrencyList?

    private var canRequest: Bool {
        return (Int(Date().timeIntervalSince1970) - (quotation?.localtimestamp ?? 0)) > requestTimeSpace
    }

    private var quotesIsEmpty: Bool {
        return quotation?.quotes?.isEmpty ?? true
    }

    init(session: Session = SessionManager.shared,
         requestTimeSpace: Int = 1800,              // 30 minutes
         service: CurrencyService? = nil,
         fileManager: FileManagerServicePort = FileManagerServiceAdapter()) {

        self.fileManager = fileManager
        self.session = session
        self.requestTimeSpace = requestTimeSpace
        self.service = service ?? CurrencyServiceWorker(
            session: session,
            service: RequestServiceAdapter()
        )

        restoreCurrencies()
        restoreQuotation()
    }

    func getQuotations(amount: Double, for symbol: String, completion: @escaping (Quotation?, Error?) -> Void) {
        getSymbols { symbols in
            if self.quotesIsEmpty || self.canRequest {
                self.service.getQuotations { [weak self] result in
                    switch result {
                    case .success(let quotation):
                        self?.saveQuotation(quotation)
                        let calculatedQuotation = QuotationCalculator(quotation: quotation).calculate(amount: amount, for: symbol)
                        let symbolQuotation = Quotation(quotation: calculatedQuotation, merging: symbols?.mappedCurrencies ?? [])
                        completion(symbolQuotation, nil)
                        return

                    case .failure(let error):
                        completion(nil, error)
                        return
                    }
                }
                return
            }

            guard let storedQuotation = self.quotation else {
                let error = NSError(domain: "Quotation not found", code: 0, userInfo: nil)
                completion(nil, error)
                return
            }

            let calculatedQuotation = QuotationCalculator(quotation: storedQuotation).calculate(amount: amount, for: symbol)
            let symbolQuotation = Quotation(quotation: calculatedQuotation, merging: symbols?.mappedCurrencies ?? [])
            completion(symbolQuotation, nil)
            return
        }
    }

    private func getSymbols(completion: @escaping (CurrencyList?) -> Void) {
        if let currencies = self.currencyList {
            completion(currencies)
            return
        }

        service.getSymbols { [weak self] result in
            switch result {
            case .success(let currencyList):
                completion(currencyList)
                self?.saveCurrencies(currencyList)
            case .failure:
                completion(nil)
            }
        }
    }

    private func saveQuotation(_ quotation: Quotation?) {
        if let quotation = quotation?.updatedQuotation, quotation.hasError == false {
            self.quotation = quotation
            saveObject(quotation, in: .quotation)
        }
    }

    private func restoreQuotation() {
        if let quotation: Quotation = restoreObject(from: .quotation) {
            self.quotation = quotation
        }
    }

    private func saveCurrencies(_ currencies: CurrencyList?) {
        if let quotation = quotation?.updatedQuotation, quotation.hasError == false {
            self.quotation = quotation
            saveObject(quotation, in: .quotation)
        }
    }

    private func restoreCurrencies() {
        if let quotation: Quotation = restoreObject(from: .quotation) {
            self.quotation = quotation
        }
    }

    private func saveObject<T: Encodable>(_ object: T, in file: File) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(object) {
            fileManager.saveFile(name: file.rawValue, content: data)
        }
    }

    private func restoreObject<T: Decodable>(from file: File) -> T? {
        let data = fileManager.readFile(name: file.rawValue)
        let decoder = JSONDecoder()

        if let data = data, let object = try? decoder.decode(T.self, from: data) {
            return object
        }
        return nil
    }
}

private extension Quotation {
    init(quotation: Quotation, merging symbols: [Currency]) {
        let quotes = (quotation.quotes ?? []).map { Quote(quote: $0, merging: symbols) }
        self.init(success: quotation.success,
                  source: quotation.source,
                  timestamp: quotation.timestamp,
                  localtimestamp: quotation.localtimestamp,
                  quotes: quotes,
                  error: quotation.error)
    }
}

private extension Quote {
    init(quote: Quote, merging symbolList:[Currency]) {
        let countrySymbol = quote.currency.suffix(3)
        let countryName = symbolList.filter { $0.symbol == countrySymbol }.first?.description ?? ""

        self.init(currency: quote.currency,
                  value: quote.value,
                  country: countryName)
    }
}
