import UIKit

class QuoteView: UIView {
    private let titleLabel: UILabel = {
        let view = UILabel()
        view.font = Style.Font.primary
        view.textAlignment = .left
        view.textColor = Style.Color.primary.foreground
        return view
    }()

    private let descriptionLabel: UILabel = {
       let view = UILabel()
        view.font = Style.Font.description
       view.textAlignment = .left
        view.textColor = Style.Color.description.foreground
       return view
    }()

    private let valueLabel: UILabel = {
        let view = UILabel()
        view.font = Style.Font.primary
        view.textAlignment = .right
        view.textColor = Style.Color.primary.foreground
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
        view.backgroundColor = Style.Color.action.background
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

    var isMarked: Bool = false {
        didSet {
            if isMarked {
                markView.backgroundColor = Style.Color.selection.foreground
                backgroundColor = Style.Color.selection.background
                return
            }
            markView.backgroundColor = Style.Color.action.background
            backgroundColor = Style.Color.primary.background
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

            markView.widthAnchor.constraint(equalToConstant: 4)
        ])

        backgroundColor = Style.Color.primary.background
    }
}
