import Foundation

struct QuoteInfo: Comparable {
    let symbol: String
    let value: Double
    let country: String

    var currencyTitle: String {
        if symbol.count > 3 {
            return String(symbol.suffix(3))
        }

        return symbol
    }

    var formattedValue: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(floatLiteral: value)) ?? "-"
    }

    static func < (lhs: QuoteInfo, rhs: QuoteInfo) -> Bool {
        return lhs.symbol < rhs.symbol
    }
}
