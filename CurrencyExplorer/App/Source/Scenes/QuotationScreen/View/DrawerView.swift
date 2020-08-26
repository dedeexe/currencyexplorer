import UIKit

class DrawerView: UIView {
    private let topStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let mainStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let buttonStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let currencyLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 20)
        view.textAlignment = .left
        view.textColor = Style.Color.secondary.token
        view.text = "USD"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let valueLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 20)
        view.textAlignment = .right
        view.textColor = Style.Color.secondary.token
        view.text = "0,00"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let textfield: UITextField = {
        let view = UITextField()
        view.font = UIFont.boldSystemFont(ofSize: 20)
        view.backgroundColor = UIColor.white
        view.textColor = UIColor.darkGray
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.textAlignment = .center
        view.keyboardType = .decimalPad
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let confirmButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Continue", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitleColor(Style.Color.secondary.token, for: .normal)
        view.backgroundColor = Style.Color.action.token
        view.titleLabel?.font = Style.Font.action.token
        view.layer.cornerRadius = 8.0
        view.layer.masksToBounds = true
        view.addTarget(self, action: #selector(send), for: .touchUpInside)
        return view
    }()

    private var bottomLayoutConstraint: NSLayoutConstraint = NSLayoutConstraint()
    private let defaultKeyboardOffset: CGFloat = -40

    var isEditing: Bool = false {
        didSet {
            editingMode(isEditing)
        }
    }

    var onConfirmValue: ((String) -> Void)?

    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        addComponents()
        setupLayout()
        bindControls()
        editingMode(false)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        layer.cornerRadius = 16
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addComponents() {
        addSubview(mainStackView)
        topStackView.addArrangedSubview(currencyLabel)
        topStackView.addArrangedSubview(valueLabel)
        mainStackView.addArrangedSubview(topStackView)
        mainStackView.addArrangedSubview(textfield)
        buttonStackView.addArrangedSubview(confirmButton)
        mainStackView.addArrangedSubview(buttonStackView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            mainStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            mainStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),

            textfield.heightAnchor.constraint(equalToConstant: 36),

            confirmButton.heightAnchor.constraint(equalToConstant: 36),
            confirmButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        bottomLayoutConstraint = mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40)
        bottomLayoutConstraint.isActive = true
        backgroundColor = Style.Color.drawer.token
    }

    private func editingMode(_ isEditing: Bool) {
        self.textfield.isHidden = isEditing == false
        self.confirmButton.isHidden = isEditing == false
        self.currencyLabel.isHidden = isEditing
        self.valueLabel.isHidden = isEditing
    }

    private func bindControls() {
        let nc = NotificationCenter.default

        nc.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
            let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
            guard let height = keyboardFrame?.cgRectValue.height else {
                return
            }
            self.bottomLayoutConstraint.constant = -(height + 30)
            self.isEditing = true
        }

        nc.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { notification in
            self.bottomLayoutConstraint.constant = self.defaultKeyboardOffset
            self.isEditing = false
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        editingMode(true)
        textfield.becomeFirstResponder()
    }

    @objc func send() {
        let value = textfield.text ?? ""
        editingMode(false)
        textfield.resignFirstResponder()
        onConfirmValue?(value)
    }
}

