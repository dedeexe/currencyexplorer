import UIKit

class TableViewHandler: NSObject, UITableViewDataSource, UITableViewDelegate {
    private unowned let tableView: UITableView

    var quotes: [QuoteInfo] = [] {
        didSet {
            reload()
        }
    }

    var onSelectItem: ((QuoteInfo, IndexPath) -> Void)?

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupComponents()
    }

    private func setupComponents() {
        tableView.backgroundColor = Style.Color.primary.background
        tableView.register(QuoteCell.self, forCellReuseIdentifier: QuoteCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func reload() {
        self.tableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuoteCell.identifier) as? QuoteCell else {
            preconditionFailure("Cell not found")
        }

        let item = quotes[indexPath.row]
        cell.quote = item
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onSelectItem?(quotes[indexPath.row], indexPath)
    }
}
