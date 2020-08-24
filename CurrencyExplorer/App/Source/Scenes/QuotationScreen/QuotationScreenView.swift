import UIKit
import HexagonEdges

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

    private let collectionView: QuotesListView = {
        let view = QuotesListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

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
        topView.addSubview(headerLabel)
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
            headerLabel.topAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerLabel.leftAnchor.constraint(equalTo: topView.leftAnchor),
            headerLabel.rightAnchor.constraint(equalTo: topView.rightAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -20)
        ])

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
        ])
    }
}
