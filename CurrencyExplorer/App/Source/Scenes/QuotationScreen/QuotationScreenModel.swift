import Foundation
import HexagonArchtecture
import HexagonEdges

final class QuotationScreenModel {
    let service: QuotationService
    private var quotes: [QuoteInfo] = []
    var onUpdateQuotes: (([QuoteInfo], Double) -> Void)?

    init(service: QuotationService = QuotationsServiceProvider.default()) {
        self.service = service
    }

    func getQuotations(amount:Double, for symbol: String) {
        service.getQuotations(amount: amount, for: symbol) { quotation, error in
            if error != nil {
                self.onUpdateQuotes?([], 0)
                return
            }
            
            let quotes = quotation?.quotes ?? []
            let mappedQuotes = quotes.map { QuoteInfo(quote: $0, selectedSymbol: symbol) }
            self.onUpdateQuotes?(mappedQuotes, amount)
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
