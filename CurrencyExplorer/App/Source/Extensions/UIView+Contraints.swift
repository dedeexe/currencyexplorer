import UIKit

extension UIView {
    func alignEdgesTo(view: UIView, spacing: CGFloat = 0.0) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor, constant: spacing).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: spacing).isActive = true
        leftAnchor.constraint(equalTo: view.leftAnchor, constant: spacing).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor, constant: spacing).isActive = true
    }
}
