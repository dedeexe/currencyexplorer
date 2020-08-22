public protocol CurrencyService {
    func getAll(completion: @escaping DecodedCompletion<CurrencyList>)
    func getQuotation(for currency: String, completion: @escaping DecodedCompletion<Quotation>)
}
