import UIKit
import HexagonEdges

class QuotesCollectionView: UIView {
    var quotes: [QuoteInfo] = [] {
        didSet {
            collectionHandler.quotes = quotes
        }
    }

    private let collectionHandler: CollectionViewHandler

    let collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return view
    }()


    init() {
        collectionHandler = CollectionViewHandler(collectionView: collectionView)
        super.init(frame: .zero)
        registerCells()
        setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func registerCells() {
        collectionView.register(QuoteCell.self, forCellWithReuseIdentifier: QuoteCell.identifier)
    }

    private func setupLayout() {
        addSubview(collectionView)
        collectionView.alignEdgesTo(view: self)
    }
}
