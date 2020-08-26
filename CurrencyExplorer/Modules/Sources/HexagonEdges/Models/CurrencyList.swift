import Foundation

public struct CurrencyList: Codable, Equatable {
    public var success: Bool?
    public var currencies: [String: String]?
    public var error: ResponseError?

    public var mappedCurrencies: [Currency] {
        if let currencies = self.currencies {
            return currencies.map { Currency(symbol: $0.key, description: $0.value) }
        }
        return []
    }

    public var hasError: Bool {
        guard let success = success else {
            return false
        }
        return success
    }
}

