import UIKit

final class BackgroundView: UIView {

    enum Style {
        case currencyCell
        case currencyInput
    }

    private let style: Style

    private let backView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()

    private let gradientView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()

    init(style: Style) {
        self.style = style
        super.init(frame: .zero)
        addComponents()
        setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addComponents() {
        addSubview(backView)
    }

    private func setupLayout() {
        backView.alignEdgesTo(view: self)
        layer.cornerRadius = style.radius
        layer.masksToBounds = style.maskedToBounds
    }
}

private extension BackgroundView.Style {
    var radius: CGFloat {
        switch self {
        case .currencyCell:
            return 8.0
        case .currencyInput:
            return 0.0
        }
    }

    var maskedToBounds: Bool {
        return self == .currencyCell
    }
}
