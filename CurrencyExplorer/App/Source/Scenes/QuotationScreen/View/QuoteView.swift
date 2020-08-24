import UIKit

class QuoteView: UIView {
    private let nameLabel: UILabel = {
        let view = UILabel()
        return view
    }()

    private let valueLabel: UILabel = {
        let view = UILabel()
        return view
    }()

    private let backImage = BackImageView()

    var currency: String? {
        didSet {
            nameLabel.text = currency
        }
    }

    var value: String? {
        didSet {
            valueLabel.text = currency
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
        addSubview(backImage)
        addSubview(nameLabel)
        addSubview(valueLabel)
    }

    private func setupLayout() {
        backImage.alignEdgesTo(view: self)
        backImage.image = nil
    }
}


