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

        let initialAmount = 1.0
        let initialSymbol = "USDUSD"
        model.getQuotations(amount: initialAmount, for: initialSymbol)
    }

    private func bindModel() {
        model.onUpdateQuotes = { quotes, amount in
            DispatchQueue.main.async {
                self.internalView.show(quotes: quotes, amount: amount)
            }
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
