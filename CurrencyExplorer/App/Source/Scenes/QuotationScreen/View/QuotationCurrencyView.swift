import UIKit

class QuotationHeaderView: UIView {
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        return view
    }()

    private let textField: UITextField = {
        let view = UITextField()
        view.keyboardType = .decimalPad
        view.font = UIFont.systemFont(ofSize: 30)
        view.backgroundColor = UIColor.clear
        view.textColor = UIColor.green
        return view
    }()

    init() {
        super.init(frame: .zero)
        setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        backgroundColor = Style.Color.primary.token
    }
}
