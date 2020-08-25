import Foundation

struct QuoteInfo: Comparable {
    let symbol: String
    let value: String
    let country: String

    var currencyTitle: String {
        if symbol.count > 3 {
            return String(symbol.suffix(3))
        }

        return symbol
    }

    static func < (lhs: QuoteInfo, rhs: QuoteInfo) -> Bool {
        return lhs.symbol < rhs.symbol
    }
}
