import UIKit

class QuoteView: UIView {
    private let titleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 16)
        view.textAlignment = .left
        view.textColor = Style.Color.secondary.token
        return view
    }()

    private let descriptionLabel: UILabel = {
       let view = UILabel()
       view.font = UIFont.systemFont(ofSize: 14)
       view.textAlignment = .left
        view.textColor = UIColor.yellow
       return view
    }()

    private let valueLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 16)
        view.textAlignment = .right
        view.textColor = Style.Color.secondary.token
        return view
    }()

    private let outerStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fill
        view.spacing = 8
        return view
    }()

    private let mainStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 8
        return view
    }()

    private let infoStackVIew: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fill
        view.spacing = 8
        return view
    }()

    private let markView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.cyan
        return view
    }()

    private var markConstraint: NSLayoutConstraint = NSLayoutConstraint()

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

    var isMarked: Bool = false {
        didSet {
            if isMarked {
                markConstraint.constant = 8
                markView.backgroundColor = .purple
                return
            }

            markView.backgroundColor = .cyan
            markConstraint.constant = 4
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
        addSubview(outerStackView)
        outerStackView.addArrangedSubview(markView)
        outerStackView.addArrangedSubview(mainStackView)
        mainStackView.addArrangedSubview(infoStackVIew)
        mainStackView.addArrangedSubview(descriptionLabel)
        infoStackVIew.addArrangedSubview(titleLabel)
        infoStackVIew.addArrangedSubview(valueLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            mainStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            mainStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
        ])

        markConstraint = markView.widthAnchor.constraint(equalToConstant: 4)
        markConstraint.isActive = true

        backgroundColor = Style.Color.primary.token
    }
}
