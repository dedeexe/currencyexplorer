import UIKit

final class QuotationScreenViewController: BaseViewController<QuotationScreenView> {

    let model: QuotationScreenModel

    override var canBecomeFirstResponder: Bool {
        return true
    }

    init(model: QuotationScreenModel) {
        self.model = model
        super.init(view: QuotationScreenView())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindModel()
        bindControls()
        model.getQuotations(amount: 1.0, for: "USDUSD")
    }

    private func bindModel() {
        model.onUpdateQuotes = { quotes in
            self.internalView.quotes = quotes.sorted()
        }
    }

    private func bindControls() {
        internalView.onSelectQuote = { quote, amount in
            self.model.getQuotations(amount: amount, for: quote.symbol)
            self.becomeFirstResponder()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        becomeFirstResponder()
    }

}
