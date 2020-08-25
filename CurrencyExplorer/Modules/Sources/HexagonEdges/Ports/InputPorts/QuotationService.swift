public protocol QuotationService {
    func getQuotations(amount: Double, for symbol: String, completion: @escaping (Quotation?, Error?) -> Void)
}
