import UIKit

private func convert(value: Int) -> CGFloat {
    let fixedValue = min(max(value, 0), 255)
    return CGFloat(fixedValue) / CGFloat(255)
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: Int = 255) {
        self.init(red: convert(value: red),
                  green: convert(value: green),
                  blue: convert(value: blue),
                  alpha: convert(value: alpha))
    }

    convenience init(literal: Int) {
        let red = (literal & 0xff0000) >> 16
        let green = (literal & 0x00ff00) >> 8
        let blue = literal & 0x0000ff
        self.init(red: red, green: green, blue: blue, alpha: 255)
    }
}
