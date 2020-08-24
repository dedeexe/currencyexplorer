import UIKit

enum Style {}

extension Style {
    enum Color: String {
        case primary
        case secondary
        case background

        var token: UIColor? {
            return UIColor(named: self.rawValue)
        }
    }
}


