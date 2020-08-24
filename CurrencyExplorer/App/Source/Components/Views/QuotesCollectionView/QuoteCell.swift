import UIKit
import HexagonEdges

class QuoteCell: UICollectionViewCell {

    static let identifier = "quiteCell"

    private let quoteView = QuoteView()

    var quote: Quote? {
        didSet {
            quoteView.currency = quote?.currency
            quoteView.value = String(quote?.value ?? 0.0)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        contentView.addSubview(quoteView)
        quoteView.alignEdgesTo(view: contentView)
    }

}
