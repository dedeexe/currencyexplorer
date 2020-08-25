import Foundation
import HexagonEdges

class CurrencyServiceWorker: CurrencyService {
    private let requestService: RequestServicePort
    private let session: Session

    init(session: Session = SessionManager.shared,
         service: RequestServicePort = RequestServiceAdapter()) {
        self.requestService = service
        self.session = session
    }

    func getSymbols(completion: @escaping DecodedCompletion<CurrencyList>) {
        let urlPath = Config.baseURL + "/list?access_key=\(session.accessToken)"
        let request = ServiceRequest(url: urlPath,
                                     method: .get,
                                     body: nil,
                                     headers: [:],
                                     timeout: 30.0)

        requestService.request(CurrencyList.self, from: request, additionalHeaders: [:]) { result in
            completion(result)
        }
    }

    func getQuotations(completion: @escaping DecodedCompletion<Quotation>) {
        let urlPath = Config.baseURL + "/live?access_key=\(session.accessToken)"
        let request = ServiceRequest(url: urlPath,
                                     method: .get,
                                     body: nil,
                                     headers: [:],
                                     timeout: 30.0)

        requestService.request(ResponseQuotation.self, from: request, additionalHeaders: [:]) { result in
            switch result {
            case .success(let response):
                let successResult = DecodedResult<Quotation>.success(Quotation(from: response))
                completion(successResult)
            case .failure(let error):
                let failResult = DecodedResult<Quotation>.failure(error)
                completion(failResult)
            }
        }
    }
}

private extension Quotation {
    init(from response: ResponseQuotation) {
        let quotes = (response.quotes ?? [:]).map { Quote(currency: $0.0, value: $0.1) }
        self.init(success: response.success,
                  source: response.source,
                  timestamp: response.timestamp,
                  localtimestamp: Int(Date().timeIntervalSince1970),
                  quotes: quotes,
                  error: response.error)
    }
}
