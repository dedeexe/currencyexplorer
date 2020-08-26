import Foundation

extension String {
    var toDouble: Double? {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        let result = formatter.number(from: self)
        return result?.doubleValue
    }
}
