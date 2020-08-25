import Foundation

public struct Quotation: Codable {
    enum CodingKeys: String, CodingKey {
        case success
        case source
        case timestamp
        case localtimestamp
        case quotes
        case error
    }

    public var success: Bool?
    public var source: String?
    public var timestamp: Int?
    public var localtimestamp: Int?
    public var quotes: [Quote]?
    public var error: ResponseError?

    public init(success: Bool?, source: String?, timestamp: Int?, localtimestamp: Int?, quotes: [Quote]?, error: ResponseError?) {
        self.success = success
        self.source = source
        self.timestamp = timestamp
        self.localtimestamp = localtimestamp
        self.quotes = quotes
        self.error = error
    }

    ///
    /// Returns a new Quotation updating localtimestamp to current local timestamp. It's a paliative situation for 
    ///
    public var updatedQuotation: Quotation {
        let result = Quotation(success: self.success,
                               source: self.source,
                               timestamp: self.timestamp,
                               localtimestamp: Int(Date().timeIntervalSince1970),
                               quotes: self.quotes,
                               error: self.error)
        return result
    }

    public var hasError: Bool {
        guard let success = success else {
            return true
        }
        return success != true
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(success, forKey: .success)
        try container.encodeIfPresent(source, forKey: .source)
        try container.encodeIfPresent(timestamp, forKey: .timestamp)
        try container.encodeIfPresent(localtimestamp, forKey: .localtimestamp)
        try container.encodeIfPresent(quotes, forKey: .quotes)
        try container.encodeIfPresent(error, forKey: .error)
    }
}
