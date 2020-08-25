public struct Quote: Codable {
    public let currency: String
    public let value: Double

    public init(currency: String, value:Double) {
        self.currency = currency
        self.value = value
    }
}
