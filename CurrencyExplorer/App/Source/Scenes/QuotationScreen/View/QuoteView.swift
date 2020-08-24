import UIKit

class QuoteView: UIView {
    private let nameLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 30)
        view.textAlignment = .left
        view.textColor = Style.Color.primary.token
        return view
    }()

    private let valueLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18)
        view.textAlignment = .right
        view.textColor = Style.Color.primary.token
        return view
    }()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 8
        return view
    }()

    private let backImage = BackgroundView(style: .secondary)

    var currency: String? {
        didSet {
            nameLabel.text = currency
        }
    }

    var value: String? {
        didSet {
            valueLabel.text = value
        }
    }

    init() {
        super.init(frame: .zero)
        addComponents()
        setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addComponents() {
        addSubview(backImage)
        addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(valueLabel)
    }

    private func setupLayout() {
        backImage.alignEdgesTo(view: self)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)
        ])

        layer.cornerRadius = 16
        layer.masksToBounds = true
    }
}


