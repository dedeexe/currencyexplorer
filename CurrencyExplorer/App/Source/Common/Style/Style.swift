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

    enum Font: String {
        case inputText
        case secondary
        
        var token: UIFont? {
            switch self {
            case .inputText:
                return UIFont.boldSystemFont(ofSize: 45)
            default:
                return UIFont.systemFont(ofSize: 30)
            }
        }
    }
}


