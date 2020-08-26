import Foundation

struct QuoteInfo: Comparable {
    let symbol: String
    let value: Double
    let country: String
    let selected: Bool

    var currencyTitle: String {
        if symbol.count > 3 {
            return String(symbol.suffix(3))
        }

        return symbol
    }

    var formattedValue: String {
        return value.formattedCurrency
    }

    static func < (lhs: QuoteInfo, rhs: QuoteInfo) -> Bool {
        return lhs.symbol < rhs.symbol
    }
}
