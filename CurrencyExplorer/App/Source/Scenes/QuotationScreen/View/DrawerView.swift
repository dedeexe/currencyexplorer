import UIKit

class DrawerView: UIView {

    private let topStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let mainStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 20
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let currencyLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 20)
        view.textAlignment = .left
        view.textColor = Style.Color.secondary.token
        view.text = "USD"
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let valueLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 20)
        view.textAlignment = .right
        view.textColor = Style.Color.secondary.token
        view.text = "0,00"
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let textfield: UITextField = {
        let view = UITextField()
        view.font = UIFont.boldSystemFont(ofSize: 16)
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let confirmButton: UIButton = {
        let view = UIButton()
        view.setTitle("Continue", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let tapGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        gesture.numberOfTapsRequired = 1
        return gesture
    }()

    private var bottomLayoutConstraint: NSLayoutConstraint = NSLayoutConstraint()
    private let defaultKeyboardOffset: CGFloat = -40

    var isEditing: Bool = false {
        didSet {
            editingMode(isEditing)
        }
    }

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
        mainStackView.addArrangedSubview(confirmButton)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            mainStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            mainStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),

            textfield.heightAnchor.constraint(equalToConstant: 36)
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
        mainStackView.addGestureRecognizer(tapGesture)
        isUserInteractionEnabled = true

        let nc = NotificationCenter.default

        nc.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
            let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
            guard let height = keyboardFrame?.cgRectValue.height else {
                return
            }
            self.bottomLayoutConstraint.constant = -height
            self.isEditing = true
        }

        nc.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { notification in
            self.bottomLayoutConstraint.constant = self.defaultKeyboardOffset
            self.isEditing = false
        }
    }

    @objc func tapAction() {
        editingMode(true)
        textfield.becomeFirstResponder()
    }
}

