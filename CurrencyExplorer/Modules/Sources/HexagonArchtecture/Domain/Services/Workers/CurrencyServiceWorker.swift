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

    func getAll(completion: @escaping DecodedCompletion<CurrencyList>) {
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

        requestService.request(Quotation.self, from: request, additionalHeaders: [:]) { result in
            completion(result)
        }
    }

}
