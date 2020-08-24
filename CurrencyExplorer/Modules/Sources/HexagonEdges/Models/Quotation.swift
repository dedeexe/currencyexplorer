public struct Quotation: Decodable, Equatable {
    public var success: Bool?
    public var source: String?
    public var timestamp: Int?
    public var quotes: [String: Double]?

    var mappedQuotes: [Quote] {
        (self.quotes ?? [:]).map { Quote(currency: $0.key, value: $0.value) }
    }
}
