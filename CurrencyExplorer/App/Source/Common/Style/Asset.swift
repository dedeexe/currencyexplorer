import UIKit

enum Asset {
    enum Color: String {
        case action
        case description
        case drawer
        case primary
        case secondary
        case selectionBackground
        case selectionMark
        case inputText

        var token: UIColor? {
            return UIColor(named: self.rawValue)
        }
    }

    enum Font: String {
        case action
        case description
        case text
        case title

        var token: UIFont? {
            switch self {
            case .action:
                return UIFont.systemFont(ofSize: 20)
            case .description:
                return UIFont.systemFont(ofSize: 14)
            case .text:
                return UIFont.boldSystemFont(ofSize: 16)
            case .title:
                return UIFont.systemFont(ofSize: 20)
            }
        }
    }
}
