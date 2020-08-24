import UIKit
import HexagonEdges

final class QuotationScreenView: UIView {
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fill
        view.axis = .vertical
        view.spacing = 8
        return view
    }()

    private let currencyView: QuotationCurrencyView = {
        let view = QuotationCurrencyView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let collectionView = QuotesCollectionView()

    var quotes: [QuoteInfo] = [] {
        didSet {
            collectionView.quotes = quotes
        }
    }

    init() {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.white
        addComponents()
        setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addComponents() {
        addSubview(stackView)
        stackView.addArrangedSubview(currencyView)
        stackView.addArrangedSubview(collectionView)
    }

    private func setupLayout() {
        let margins = self.safeAreaLayoutGuide
        stackView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        stackView.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -8).isActive = true

        currencyView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
