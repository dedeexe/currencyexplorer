import DDXNetwork
import Foundation
import HexagonEdges

final class RequestServiceAdapter: RequestServicePort {

    private let http: HttpService
    private var decoder: JSONDecoder

    init(decoder: JSONDecoder? = nil, http: HttpService = HttpWorker()) {
        self.http = http
        self.decoder = RequestServiceAdapter.generateDecoder(from: decoder)
    }

    func requestData(from request: ServiceRequestEntity,
                     additionalHeaders: ServiceHeaders,
                     completion: ServiceCompletion?) {

        http.request(request,
                     additionalHeaders: additionalHeaders,
                     completion: completion)
    }

    func request<T: Decodable>(_ type: T.Type,
                                      from request: ServiceRequestEntity,
                                      additionalHeaders: ServiceHeaders = [:],
                                      completion: DecodedCompletion<T>?) {

        http.request(request, additionalHeaders: additionalHeaders) { dataResult in

            switch dataResult {
            case .failure(let error):
                completion?(.failure(error))

            case .success(let data):
                do {
                    let decodedObject = try self.decoder.decode(type, from: data)
                    completion?(.success(decodedObject))
                } catch {
                    completion?(.failure(error))
                }
            }
        }
    }

    static private func generateDecoder(from decoder: JSONDecoder?) -> JSONDecoder {
        if let jsonDecoder = decoder {
            return jsonDecoder
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}

