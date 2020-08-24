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

    private let backView: BackgroundView = {
        let view = BackgroundView(style: .currencyInput)
        return view
    }()

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
        addSubview(backView)
    }

    private func setupLayout() {
        backView.alignEdgesTo(view: self)
    }
}
