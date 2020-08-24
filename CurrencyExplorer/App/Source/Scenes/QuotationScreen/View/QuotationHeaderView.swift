import UIKit

class QuotationHeaderView: UIView {
    private let mainStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fill
        return view
    }()

    private let secondaryStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        return view
    }()

    private let textField = CurrencyTextField()

    private let descriptionLabel: UILabel = {
        let view = UILabel()
        view.font = Style.Font.secondary.token
        view.textColor = Style.Color.secondary.token
        view.backgroundColor = UIColor.clear
        view.textAlignment = .center
        return view
    }()

    var complement: String? {
        didSet {
            textField.complementText = complement
        }
    }

    var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
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
        secondaryStackView.addArrangedSubview(descriptionLabel)
        secondaryStackView.addArrangedSubview(textField)
        mainStackView.addArrangedSubview(secondaryStackView)
        addSubview(mainStackView)
    }

    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = Style.Color.primary.token
        mainStackView.alignEdgesTo(view: self)
    }
}
