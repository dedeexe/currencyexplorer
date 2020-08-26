import UIKit

class QuoteCell: UITableViewCell {

    static let identifier = "quoteCell"

    private let quoteView = QuoteView()

    var quote: QuoteInfo? {
        didSet {
            quoteView.currency = quote?.currencyTitle
            quoteView.value = quote?.formattedValue
            quoteView.descriptionText = quote?.country
            quoteView.isMarked = quote?.selected ?? false
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        contentView.addSubview(quoteView)
        quoteView.alignEdgesTo(view: contentView)
        contentView.backgroundColor = Style.Color.primary.token
    }

}
