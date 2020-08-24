import UIKit
import HexagonEdges

final class QuotationScreenView: UIView {

    private let topView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let headerView: QuotationHeaderView = {
        let view = QuotationHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let collectionView: QuotesCollectionView = {
        let view = QuotesCollectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var descriptionText: String? {
        didSet {
            headerView.descriptionText = descriptionText
        }
    }

    var currencyText: String? {
        didSet {
            headerView.complement = currencyText
        }
    }

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
        topView.addSubview(headerView)
        addSubview(topView)
        addSubview(collectionView)
    }

    private func setupLayout() {
        backgroundColor = Style.Color.primary.token

        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            topView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            topView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0)
        ])

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.topAnchor, constant: 40),
            headerView.leftAnchor.constraint(equalTo: topView.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: topView.rightAnchor),
            headerView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -20)
        ])

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
        ])
    }
}
