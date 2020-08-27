import XCTest
import HexagonEdges
@testable import CurrencyExplorer

class QuotationScreenModelTests: XCTestCase {

    var sut: QuotationScreenModel!

    func testSuccess() throws {
        let expectation = XCTestExpectation()
        let expectedQuotaton = QuotationServiceMock.createQuotation()
        sut = QuotationScreenModel(service: QuotationServiceMock(quotation: expectedQuotaton))

        sut.onUpdateQuotes = { quotation, amount in
            XCTAssertEqual(1000, amount)
            XCTAssertEqual(quotation.count, 3)
            XCTAssertTrue(quotation.contains(QuoteInfo(symbol: "first", value: 12345, country: "", selected: false)))
            XCTAssertTrue(quotation.contains(QuoteInfo(symbol: "second", value: 67890, country: "", selected: false)))
            XCTAssertTrue(quotation.contains(QuoteInfo(symbol: "third", value: 13579, country: "", selected: false)))
            expectation.fulfill()
        }

        sut.getQuotations(amount: 1000, for: "USD")
        wait(for: [expectation], timeout: 10.0)
    }

    func testFail() throws {
        let expectation = XCTestExpectation()
        let error = NSError(domain: "", code: 0, userInfo: nil)
        sut = QuotationScreenModel(service: QuotationServiceMock(error: error))

        sut.onUpdateQuotes = { quotation, amount in
            XCTAssertEqual(0.0, amount)
            XCTAssertEqual(quotation.count, 0)
            expectation.fulfill()
        }

        sut.getQuotations(amount: 1000, for: "USD")
        wait(for: [expectation], timeout: 10.0)
    }

}



