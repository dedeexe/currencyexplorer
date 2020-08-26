import Foundation
import HexagonEdges
@testable import CurrencyExplorer

class QuotationServiceMock: QuotationService {
    let quotation: Quotation?
    let error: Error?

    init(quotation: Quotation) {
        self.quotation = quotation
        self.error = nil
    }

    init(error: Error) {
        self.quotation = nil
        self.error = error
    }

    func getQuotations(amount: Double, for symbol: String, completion: @escaping (Quotation?, Error?) -> Void) {
        if let quotation = self.quotation {
            completion(quotation, nil)
        }

        if let error = self.error {
            completion(nil, error)
        }
    }

    static func createQuotation() -> Quotation {
        return Quotation(success: true,
                         source: "USD",
                         timestamp: 12345,
                         localtimestamp: 12345,
                         quotes: [
                            .init(currency: "first", value: 12345),
                            .init(currency: "second", value: 67890),
                            .init(currency: "third", value: 13579)
                         ],
                         error: nil)
    }
}
