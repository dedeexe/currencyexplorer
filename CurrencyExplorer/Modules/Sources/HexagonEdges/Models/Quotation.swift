public struct Quotation: Codable {
    public var success: Bool?
    public var source: String?
    public var timestamp: Int?
    public var quotes: [Quote]?
    public var error: ResponseError?

    enum CodingKeys: String, CodingKey {
        case success
        case source
        case timestamp
        case quotes
        case error
    }

    public init(success: Bool?, source: String?, timestamp: Int?, quotes: [Quote]?, error: ResponseError?) {
        self.success = success
        self.source = source
        self.timestamp = timestamp
        self.quotes = quotes
        self.error = error
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(success, forKey: .success)
        try container.encodeIfPresent(source, forKey: .source)
        try container.encodeIfPresent(timestamp, forKey: .timestamp)
        try container.encodeIfPresent(quotes, forKey: .quotes)
        try container.encodeIfPresent(error, forKey: .error)
    }

    public var hasError: Bool {
        guard let success = success else {
            return true
        }
        return success != true
    }
}
