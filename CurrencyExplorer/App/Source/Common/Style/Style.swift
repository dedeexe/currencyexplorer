import UIKit

enum Style {}

struct StyleColor {
    let background: UIColor?
    let foreground: UIColor?

    init(foreground: UIColor?, background: UIColor?) {
        self.background = background
        self.foreground = foreground
    }

    init(color: UIColor?) {
        self.background = color
        self.foreground = color
    }

    init(foreground: UIColor?) {
        self.foreground = foreground
        self.background = UIColor.clear
    }
}

extension Style {
    enum Color {
        static let drawer = StyleColor(foreground: Asset.Color.secondary.token, background: Asset.Color.drawer.token)
        static let primary = StyleColor(foreground: Asset.Color.secondary.token, background: Asset.Color.primary.token)
        static let action = StyleColor(foreground: Asset.Color.secondary.token, background: Asset.Color.action.token)
        static let selection = StyleColor(foreground: Asset.Color.selectionMark.token, background: Asset.Color.selectionBackground.token)
        static let inputText = StyleColor(foreground: Asset.Color.inputText.token, background: Asset.Color.secondary.token)
        static let description = StyleColor(foreground: Asset.Color.description.token, background: Asset.Color.primary.token)

    }

    enum Font {
        static let action = Asset.Font.action.token
        static let description = Asset.Font.description.token
        static let info = Asset.Font.action.token
        static let primary = Asset.Font.text.token
        static let title = Asset.Font.title.token
    }
}

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
