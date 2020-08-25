import HexagonEdges

public enum QuotationsServiceProvider {
    public static func `default`() -> QuotationService {
        return QuotationServiceWorker(session: SessionManager.shared)
    }
}
