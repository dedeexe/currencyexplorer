import UIKit
import HexagonEdges

class CollectionViewHandler: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    private unowned let collectionView: UICollectionView
    private let spacing = CGFloat(8.0)

    var quotes: [Quote] = [] {
        didSet {
            reload()
        }
    }

    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        setupCollectionView()
    }

    private func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = flowLayout
        collectionView.backgroundColor = UIColor.white
        collectionView.register(QuoteCell.self, forCellWithReuseIdentifier: QuoteCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func reload() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quotes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = quotes[indexPath.row]

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuoteCell.identifier, for: indexPath) as? QuoteCell else {
            preconditionFailure("QuoteCell not found")
        }

        cell.quote = item
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = max(collectionView.bounds.width / 2 - spacing, 0)
        let height = width * 0.60
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

}
