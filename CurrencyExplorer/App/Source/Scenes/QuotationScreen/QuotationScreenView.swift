import UIKit

final class QuotationScreenView: UIView {

    private let topView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let headerLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Quotations"
        view.textAlignment = .center
        view.font = Style.Font.secondary.token
        view.textColor = Style.Color.secondary.token
        return view
    }()

    private let drawer = DrawerView()

    private let listView: QuotesListView = {
        let view = QuotesListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var currencyText: String? {
        didSet {
            drawer.currency = currencyText ?? ""
        }
    }

    var quotes: [QuoteInfo] = [] {
        didSet {
            drawer.currency = quotes.filter { $0.selected }.first?.currencyTitle ?? "-"
            listView.quotes = quotes
        }
    }

    var onSelectQuote: ((QuoteInfo, Double) -> Void)?

    init() {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.white
        addComponents()
        setupLayout()
        bindControls()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addComponents() {
        topView.addSubview(headerLabel)
        addSubview(topView)
        addSubview(listView)
        addSubview(drawer)
    }

    private func setupLayout() {
        backgroundColor = Style.Color.primary.token

        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            topView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            topView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0)
        ])

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerLabel.leftAnchor.constraint(equalTo: topView.leftAnchor),
            headerLabel.rightAnchor.constraint(equalTo: topView.rightAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -20)
        ])

        NSLayoutConstraint.activate([
            listView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0),
            listView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            listView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            listView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
        ])

        NSLayoutConstraint.activate([
            drawer.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            drawer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            drawer.rightAnchor.constraint(equalTo: rightAnchor, constant: 0)
        ])
    }

    private func bindControls() {
        listView.onSelectItem = { quote, _ in
            self.onSelectQuote?(quote, self.drawer.value)
        }

        drawer.onConfirmValue = { value in
            if let selected = self.quotes.filter { $0.selected }.first {
                self.onSelectQuote?(selected, value)
            }
        }
    }
}
