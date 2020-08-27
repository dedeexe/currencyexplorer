import UIKit

enum Style {}

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
