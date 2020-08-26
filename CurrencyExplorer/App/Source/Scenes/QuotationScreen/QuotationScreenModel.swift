import Foundation
import HexagonArchtecture
import HexagonEdges

final class QuotationScreenModel {
    let service: QuotationService
    private var quotes: [QuoteInfo] = []
    var onUpdateQuotes: (([QuoteInfo]) -> Void)?

    init(service: QuotationService = QuotationsServiceProvider.default()) {
        self.service = service
    }

    func getQuotations(amount:Double, for symbol: String) {
        service.getQuotations(amount: amount, for: symbol) { quotation, error in
            if error != nil {
                self.onUpdateQuotes?([])
                return
            }
            
            let quotes = quotation?.quotes ?? []
            self.onUpdateQuotes?(quotes.map { QuoteInfo(quote: $0, selectedSymbol: symbol) })
        }
    }
}

private extension QuoteInfo {
    init(quote: Quote, selectedSymbol: String) {
        self.init(symbol: quote.currency,
                  value: quote.value,
                  country: quote.country,
                  selected: quote.currency == selectedSymbol)
    }
}
