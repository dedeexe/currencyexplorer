import UIKit

enum Style {}

extension Style {
    enum Color: String {
        case primary
        case secondary
        case background
        case drawer
        case action

        var token: UIColor? {
            return UIColor(named: self.rawValue)
        }
    }

    enum Font: String {
        case inputText
        case secondary
        case action
        
        var token: UIFont? {
            switch self {
            case .inputText:
                return UIFont.boldSystemFont(ofSize: 45)
            case .action:
                return UIFont.systemFont(ofSize: 20)
            default:
                return UIFont.systemFont(ofSize: 20)
            }
        }
    }
}
