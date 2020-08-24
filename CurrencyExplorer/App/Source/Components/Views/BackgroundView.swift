import UIKit

final class BackgroundView: UIView {

    enum Style {
        case primary
        case secondary
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
        backView.backgroundColor = style.color
    }
}

private extension BackgroundView.Style {
    var color: UIColor? {
        switch self {
        case .secondary:
            return Style.Color.secondary.token
        default:
            return Style.Color.primary.token
        }
    }
}

