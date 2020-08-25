import UIKit

class QuotesListView: UIView {
    var quotes: [QuoteInfo] = [] {
        didSet {
            tableHandler.quotes = quotes
        }
    }

    var onSelectItem: ((QuoteInfo, IndexPath) -> Void)?

    private let tableHandler: TableViewHandler

    let tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.backgroundColor = Style.Color.primary.token
        return view
    }()

    init() {
        tableHandler = TableViewHandler(tableView: tableView)
        super.init(frame: .zero)
        setupLayout()
        bindControls()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        addSubview(tableView)
        tableView.alignEdgesTo(view: self)
    }

    private func bindControls() {
        tableHandler.onSelectItem = { item, indexPath in
            self.onSelectItem?(item, indexPath)
        }
    }
}
