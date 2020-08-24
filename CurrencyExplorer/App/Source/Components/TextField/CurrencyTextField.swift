import UIKit

final class CurrencyTextField: UITextField {
    init() {
        super.init(frame: .zero)
        setupLayout()
        delegate = self
    }

    private var currentText: String = ""
    var complementText: String?
    var onUpdateText: ((String) -> Void)?

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = colorWhenIsEditing(isEditing)
    }

    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = Style.Color.primary.token
        textColor = Style.Color.secondary.token
        font = Style.Font.inputText.token
        keyboardType = .numberPad
        textAlignment = .center
    }

    private func colorWhenIsEditing(_ editing: Bool) -> UIColor? {
        if editing == false {
            return Style.Color.primary.token
        }

        return UIColor.blue
    }
}

extension CurrencyTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
        currentText = text
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        var text = currentText

        if text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false {
            text += " "
        }

        text += complementText ?? ""
        textField.text = text
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = currentText
    }
}
