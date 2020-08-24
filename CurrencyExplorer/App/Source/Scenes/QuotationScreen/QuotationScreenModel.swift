import Foundation
import HexagonArchtecture
import HexagonEdges

final class QuotationScreenModel {
    let service = CurrencyServiceProvider.default()

    var onUpdateQuotes: (([QuoteInfo]) -> Void)?

    init() {}

    func getQuotations() {
        service.getQuotations { result in
            switch result {
            case .success(let quotations):
                self.onUpdateQuotes?(quotations.mappedQuotes.map(QuoteInfo.init))
            case .failure:
                self.onUpdateQuotes?([])
            }
        }
    }
}

private extension QuoteInfo {
    init(quote: Quote) {
        self.init(symbol: quote.currency,
                  value: String(quote.value),
                  country: "País muito louco das estrelas")
    }
}
