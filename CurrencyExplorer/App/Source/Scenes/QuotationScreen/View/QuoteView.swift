import UIKit

class QuoteView: UIView {
    private let titleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 14)
        view.textAlignment = .left
        view.textColor = Style.Color.secondary.token
        return view
    }()

    private let descriptionLabel: UILabel = {
       let view = UILabel()
       view.font = UIFont.systemFont(ofSize: 14)
       view.textAlignment = .right
        view.textColor = UIColor.lightGray
       return view
    }()

    private let valueLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 20)
        view.textAlignment = .right
        view.textColor = Style.Color.secondary.token
        return view
    }()

    private let mainStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fill
        view.spacing = 8
        return view
    }()

    private let infoStackVIew: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 8
        return view
    }()

    var currency: String? {
        didSet {
            titleLabel.text = currency
        }
    }

    var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
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
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(infoStackVIew)
        mainStackView.addArrangedSubview(valueLabel)
        infoStackVIew.addArrangedSubview(titleLabel)
        infoStackVIew.addArrangedSubview(descriptionLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            mainStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            mainStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20)
        ])

        backgroundColor = Style.Color.primary.token
    }
}


