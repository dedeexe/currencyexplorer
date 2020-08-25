//
//  File.swift
//  
//
//  Created by User on 8/24/20.
//

import Foundation
import HexagonEdges

struct QuotationCalculator {
    let quotation: Quotation

    init(quotation: Quotation) {
        self.quotation = quotation
    }

    func calculate(amount: Double, for symbol: String) -> Quotation {
        var calculatedQuotation = quotation

        if let sourceQuote = quotation.quotes?.first(where: { $0.currency == symbol }) {
            let quotes = (quotation.quotes ?? [])
                .map { Quote(from: $0, sourceValue: sourceQuote.value, amount: amount) }
            calculatedQuotation.quotes = quotes
        }

        return calculatedQuotation
    }
}

private extension Quote {
    init(from quote:Quote, sourceValue: Double, amount: Double) {
        let value = (quote.value / sourceValue) * amount
        self.init(currency: quote.currency, value: value)
    }
}
