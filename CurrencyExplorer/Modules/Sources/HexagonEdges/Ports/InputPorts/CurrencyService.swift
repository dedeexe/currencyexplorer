public protocol CurrencyService {
    func getSymbols(completion: @escaping DecodedCompletion<CurrencyList>)
    func getQuotations(completion: @escaping DecodedCompletion<Quotation>)
}
