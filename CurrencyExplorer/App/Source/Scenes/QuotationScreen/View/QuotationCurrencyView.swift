import UIKit

class QuotationCurrencyView: UIView {

    private let textField: UITextField = {
        let view = UITextField()
        view.keyboardType = .decimalPad
        view.font = UIFont.systemFont(ofSize: 30)
        view.backgroundColor = UIColor.clear
        view.textColor = UIColor.green
        return view
    }()

    private func addComponents() {
        addSubview(textField)
    }

}
