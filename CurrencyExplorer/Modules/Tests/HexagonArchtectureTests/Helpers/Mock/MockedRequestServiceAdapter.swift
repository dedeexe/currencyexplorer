import HexagonEdges
import XCTest

class MockedRequestServiceAdapter: RequestServicePort {

    let fixtureData: Data
    let error: Error!

    init(data: Data) {
        self.fixtureData = data
        self.error = nil
    }

    init(error: Error) {
        self.fixtureData = Data(capacity: 0)
        self.error = error
    }

    func requestData(from request: ServiceRequestEntity, additionalHeaders: ServiceHeaders, completion: ServiceCompletion?) {

        if error != nil {
            completion?(.failure(error))
            return
        }

        completion?(.success(fixtureData))

    }

    func request<T>(_ type: T.Type,
                    from request: ServiceRequestEntity,
                    additionalHeaders: ServiceHeaders,
                    completion: DecodedCompletion<T>?) where T : Decodable {

        requestData(from: request, additionalHeaders: additionalHeaders) { result in
            switch result {
            case .failure(let err):
                let failResult: DecodedResult<T> = .failure(err)
                completion?(failResult)
            case .success(let data):
                let decoder = JSONDecoder()
                let object = try! decoder.decode(T.self, from: data)
                let successResult: DecodedResult<T> = .success(object)
                completion?(successResult)
            }
        }
    }
}


