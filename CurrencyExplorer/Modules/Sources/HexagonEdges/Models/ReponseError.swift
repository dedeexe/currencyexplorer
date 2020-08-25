import Foundation

public struct ResponseError: Codable, Equatable {
    var code: Int?
    var info: String?
}
