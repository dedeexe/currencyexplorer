import Foundation
import HexagonEdges

public class CurrencyServiceWorker: CurrencyService {

    private let requestService: RequestServicePort
    private let session: Session

    public init(session: Session = SessionManager.shared,
                service: RequestServicePort = RequestServiceAdapter()) {
        self.requestService = service
        self.session = session
    }

    public func getAll(completion: @escaping DecodedCompletion<CurrencyList>) {
        let request = ServiceRequest(url: Config.baseURL + "/list?access_key=\(session.accessToken)",
                                     method: .get,
                                     body: nil,
                                     headers: [:],
                                     timeout: 30.0)

        requestService.request(CurrencyList.self, from: request, additionalHeaders: [:]) { result in
            completion(result)
        }
    }

    public func getQuotation(for currency: String, completion: @escaping DecodedCompletion<Quotation>) {
        let request = ServiceRequest(url: Config.baseURL + "/live?access_key=\(session.accessToken)",
                                     method: .get,
                                     body: nil,
                                     headers: [:],
                                     timeout: 30.0)

        requestService.request(Quotation.self, from: request, additionalHeaders: [:]) { result in
            completion(result)
        }
    }

}
