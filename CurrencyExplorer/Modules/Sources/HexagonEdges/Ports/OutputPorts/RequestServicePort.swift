import Foundation
import DDXNetwork

public typealias ServiceRequestEntity = RequestModel
public typealias ServiceHeaders = HttpHeaders
public typealias ServiceBody = HttpBody
public typealias ServiceMethod = HttpMethod

public typealias ServiceResult = Result<Data, Error>
public typealias ServiceCompletion = (HttpResult) -> Void

public protocol RequestServicePort {
    func requestData(from request: ServiceRequestEntity,
                     additionalHeaders: ServiceHeaders,
                     completion: ServiceCompletion?)

    func request<T: Decodable>(_ type: T.Type,
                               from request: ServiceRequestEntity,
                               additionalHeaders: ServiceHeaders,
                               completion: DecodedCompletion<T>?)
}

