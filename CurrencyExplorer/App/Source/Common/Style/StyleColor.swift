import UIKit

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
