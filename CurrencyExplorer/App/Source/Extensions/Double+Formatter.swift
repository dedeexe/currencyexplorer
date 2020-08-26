import Foundation

extension Double {
    var formattedCurrency: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(floatLiteral: self)) ?? "-"
    }

    var formattedLocalizedNumber: String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(floatLiteral: self))
    }

    var string: String {
        return String(self)
    }
}
