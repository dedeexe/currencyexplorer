public protocol CurrencyService {
    func getAll(completion: @escaping DecodedCompletion<CurrencyList>)
    func getQuotations(completion: @escaping DecodedCompletion<Quotation>)
}
