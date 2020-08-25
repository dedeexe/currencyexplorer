public struct ResponseQuotation: Decodable, Equatable {
    public var success: Bool?
    public var source: String?
    public var timestamp: Int?
    public var quotes: [String: Double]?
    public var error: ResponseError?
}
