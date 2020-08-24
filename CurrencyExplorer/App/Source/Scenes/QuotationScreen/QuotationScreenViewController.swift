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
        setupModel()
        model.getQuotations()

        internalView.currencyText = "JPY"
        internalView.descriptionText = "Japão Yene"
    }

    private func setupModel() {
        model.onUpdateQuotes = { quotes in
            self.internalView.quotes = quotes
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        becomeFirstResponder()
    }
}
