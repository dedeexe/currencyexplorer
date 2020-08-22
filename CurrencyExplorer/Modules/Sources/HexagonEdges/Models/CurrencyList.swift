import Foundation

public struct CurrencyList: Decodable, Equatable {

    public var success: Bool?
    public var currencies: [String: String]?

    public var mappedCurrencies: [Currency] {
        if let currencies = self.currencies {
            return currencies.map { Currency(symbol: $0.key, description: $0.value) }
        }
        return []
    }
}

