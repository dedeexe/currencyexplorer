import UIKit

struct ThemeColor {
    let darkMode: UIColor
    let lightMode: UIColor

    var color: UIColor {
        switch UIScreen.main.traitCollection.userInterfaceStyle {
        case .dark:
            return darkMode
        default:
            return lightMode
        }
    }

    init(light: UIColor, dark: UIColor) {
        self.darkMode = dark
        self.lightMode = light
    }

    init(_ color: UIColor) {
        self.darkMode = color
        self.lightMode = color
    }
}
