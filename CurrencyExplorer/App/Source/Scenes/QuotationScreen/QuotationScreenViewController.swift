import UIKit

final class QuotationScreenViewController: BaseViewController<QuotationScreenView> {

    let model: QuotationScreenModel

    init(model: QuotationScreenModel) {
        self.model = model
        super.init(view: QuotationScreenView())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupModel()
        model.getQuotations()
    }

    private func setupModel() {
        model.onUpdateQuotes = { quotes in
            self.internalView.quotes = quotes
        }
    }
}
