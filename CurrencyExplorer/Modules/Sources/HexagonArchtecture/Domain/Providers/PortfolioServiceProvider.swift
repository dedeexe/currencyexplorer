import HexagonEdges

public enum CurrencyServiceProvider {
    public static func `default`() -> CurrencyService {
        return CurrencyServiceWorker()
    }
}
