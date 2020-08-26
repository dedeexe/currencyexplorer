import Foundation

extension Double {
    var formattedCurrency: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(floatLiteral: self)) ?? "-"
    }

    var string: String {
        return String(self)
    }
}
