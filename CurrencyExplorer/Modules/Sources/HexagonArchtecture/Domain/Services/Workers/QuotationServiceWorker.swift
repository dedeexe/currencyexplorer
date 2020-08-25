import Foundation
import HexagonEdges

///
/// A proxy for CurrencyServiceWorker. Manage the  cache anda bypass requests for CyrrencyServiceWorker
///
class QuotationServiceWorker: QuotationService {

    private let filename = "quotations.json"
    private let fileManager: FileManagerServicePort
    private let session: Session
    private let service: CurrencyService
    private let requestTimeSpace: Int
    private var quotation: Quotation?

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

        restoreQuotation()
    }

    func getQuotations(amount: Double, for symbol: String, completion: @escaping (Quotation?, Error?) -> Void) {
        if quotesIsEmpty || canRequest {
            service.getQuotations { [weak self] result in
                switch result {
                case .success(let quotation):
                    self?.saveQuotation(quotation)
                    let calculatedQuotation = QuotationCalculator(quotation: quotation).calculate(amount: amount, for: symbol)
                    completion(calculatedQuotation, nil)
                    return

                case .failure(let error):
                    completion(nil, error)
                    return
                }
            }
            return
        }

        guard let storedQuotation = quotation else {
            let error = NSError(domain: "Quotation not found", code: 0, userInfo: nil)
            completion(nil, error)
            return
        }

        let calculatedQuotation = QuotationCalculator(quotation: storedQuotation).calculate(amount: amount, for: symbol)
        completion(calculatedQuotation, nil)
        return
    }

    private func saveQuotation(_ quotation: Quotation?) {
        guard let quotation = quotation?.updatedQuotation, quotation.hasError == false else {
            return
        }

        self.quotation = quotation
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(quotation) {
            fileManager.saveFile(name: filename, content: data)
        }
    }

    private func restoreQuotation() {
        fileManager.readFile(name: self.filename) { data in
            let decoder = JSONDecoder()
            if let data = data, let quotation = try? decoder.decode(Quotation.self, from: data) {
                self.quotation = quotation
            }
        }
    }

}
