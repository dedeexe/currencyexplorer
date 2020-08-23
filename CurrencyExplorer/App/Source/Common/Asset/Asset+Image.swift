import UIKit

extension Asset {
    enum Image: String {
        case placeholder

        var resource: UIImage? {
            return UIImage(named: self.rawValue)
        }
    }
}
