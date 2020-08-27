import Foundation

import XCTest
import SnapshotTesting
import  HexagonEdges
@testable import CurrencyExplorer

class QuotationScreenViewControllerTests: XCTestCase {

    var sut: QuotationScreenViewController!
    let recordSnapshot = false
    let queue = DispatchQueue(label: "x")

    func testDefaultSnapshot() throws {
        let model = QuotationScreenModel(service: QuotationServiceMock(quotation: createQuotes()))
        sut = QuotationScreenViewController(model: model)
        _ = sut.view

        let expectation = XCTestExpectation()

        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 3.0)
            DispatchQueue.main.async {
                assertSnapshot(matching: self.sut, as: .image(on: .iPhoneX), record: self.recordSnapshot)
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 10.0)
    }

    func createQuotes() -> Quotation {
        return Quotation(success: true,
                         source: "USDCAD",
                         timestamp: 12345,
                         localtimestamp: 12345,
                         quotes: [
                            .init(currency: "USDEUR", value: 0.845025, country: "Euro"),
                            .init(currency: "USDGBP", value: 0.756585, country: "British Pound Sterling"),
                            .init(currency: "USDUSD", value: 1.0, country: "US Dollar"),
                            .init(currency: "USDPLN", value: 3.73474, country: "Polish Zloty"),
                            .init(currency: "USDBRL", value: 5.592975, country: "Brazilian Real")
                         ],
                         error: nil)
    }
}
