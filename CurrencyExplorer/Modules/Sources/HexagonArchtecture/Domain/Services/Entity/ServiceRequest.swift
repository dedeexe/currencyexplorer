import Foundation
import HexagonEdges

struct ServiceRequest: ServiceRequestEntity {
    var url: String
    var method: ServiceMethod
    var body: ServiceBody?
    var headers: ServiceHeaders
    var timeout: TimeInterval
}
