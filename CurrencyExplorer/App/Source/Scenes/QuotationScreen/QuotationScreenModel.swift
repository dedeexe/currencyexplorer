import Foundation
import HexagonArchtecture
import HexagonEdges

final class QuotationScreenModel {
    let service = QuotationsServiceProvider.default()
    private var quotes: [QuoteInfo] = []
    var onUpdateQuotes: (([QuoteInfo]) -> Void)?

    init() {}

    func getQuotations(amount:Double, for symbol: String = "USD") {
        service.getQuotations(amount: amount, for: symbol) { quotation, error in
            if error != nil {
                self.onUpdateQuotes?([])
                return
            }
            
            let quotes = quotation?.quotes ?? []
            self.onUpdateQuotes?(quotes.map(QuoteInfo.init))
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
