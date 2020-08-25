public struct Quote: Codable {
    public let currency: String
    public let value: Double
    public let country: String

    public init(currency: String, value:Double, country: String = "") {
        self.currency = currency
        self.value = value
        self.country = country
    }
}
