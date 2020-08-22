@testable import HexagonArchtecture
import HexagonEdges
import DDXNetwork
import XCTest

class CurrencyServiceWorkerIntegrationTests: XCTestCase {

    var sut: CurrencyServiceWorker!
    var service: RequestServicePort!

    ///
    /// Testes if endpoint to get the list of currencies is working and giving back a valida structure of data
    ///

    func testGetAll() {
        sut = CurrencyServiceWorker(session: SessionManager(),
                                    service: RequestServiceAdapter())

        let expectation = XCTestExpectation()

        sut.getAll { result in

            switch result {
            case .success(let currencyList):
                XCTAssertTrue(currencyList.success ?? false)
                XCTAssertNotNil(currencyList.currencies)
                XCTAssertTrue((currencyList.currencies?.count ?? 0) > 0)

            case .failure:
                XCTFail("Unexpected error. It shout be success")
            }

            expectation.fulfill()

        }

        wait(for: [expectation], timeout: 10.0)
    }

    ///
    /// Testes if endpoint to get the quotation of currencies is working and giving back a valida structure of data
    ///

    func testQuotation() {
        sut = CurrencyServiceWorker(session: SessionManager(),
                                    service: RequestServiceAdapter())

        let expectation = XCTestExpectation()

        sut.getQuotation(for: "USD") { result in

            switch result {
            case .success(let quotation):
                XCTAssertTrue(quotation.success ?? false)
                XCTAssertTrue((quotation.timestamp ?? 0) > 0)
                XCTAssertTrue((quotation.quotes?.count ?? 0) > 0)

            case .failure:
                XCTFail("Unexpected error. It shout be success")
            }

            expectation.fulfill()

        }

        wait(for: [expectation], timeout: 10.0)
    }
}
