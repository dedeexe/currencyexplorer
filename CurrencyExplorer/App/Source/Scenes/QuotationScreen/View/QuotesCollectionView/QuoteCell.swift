import UIKit
import HexagonEdges

class QuoteCell: UICollectionViewCell {

    static let identifier = "quiteCell"

    private let quoteView = QuoteView()

    var quote: QuoteInfo? {
        didSet {
            quoteView.currency = quote?.symbol
            quoteView.value = String(quote?.value ?? "")
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
