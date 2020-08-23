import UIKit

final class QuotationScreenView: UIView {
    private let collection: UICollectionView = {
        let view = UICollectionView()
        return view
    }()

    init() {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.white
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        
    }
}
