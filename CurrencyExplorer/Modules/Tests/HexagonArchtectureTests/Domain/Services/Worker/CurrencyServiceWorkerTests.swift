@testable import HexagonArchtecture
import HexagonEdges
import DDXNetwork
import XCTest

class CurrencyServiceWorkerTests: XCTestCase {

    var sut: CurrencyServiceWorker!
    var service: RequestServicePort!

    func testGetAllSuccess() {
        let service = MockedRequestServiceAdapter(data: Fixture.CurrencyList.data)
        sut = CurrencyServiceWorker(service: service)
        let expectation = XCTestExpectation()

        sut.getAll { result in

            switch result {
            case .success(let currencyList):
                let currencies = currencyList.mappedCurrencies.sorted { $0.symbol ?? "" < $1.symbol ?? "" }
                XCTAssertEqual(4, currencies.count)
                XCTAssertEqual(currencies[0].symbol, "BRL")
                XCTAssertEqual(currencies[1].symbol, "BSD")
                XCTAssertEqual(currencies[2].symbol, "JPY")
                XCTAssertEqual(currencies[3].symbol, "USD")

            case .failure:
                XCTFail("Unexpected error. It shout be success")
            }

            expectation.fulfill()

        }

        wait(for: [expectation], timeout: 10.0)
    }

    func testGetAllFail() {
        let error = NSError(domain: "Expected error", code: 555, userInfo: nil)
        let service = MockedRequestServiceAdapter(error: error)
        sut = CurrencyServiceWorker(service: service)
        let expectation = XCTestExpectation()

        sut.getAll { result in

            switch result {
            case .success:
                XCTFail("Unexpected error. It shout get a fail")

            case .failure(let error as NSError):
                XCTAssertEqual(error.code, 555)
                XCTAssertEqual(error.domain, "Expected error")
            }

            expectation.fulfill()

        }

        wait(for: [expectation], timeout: 10.0)
    }

    func testGetQuotationSuccess() {
        let service = MockedRequestServiceAdapter(data: Fixture.Quotes.data)
        sut = CurrencyServiceWorker(service: service)
        let expectation = XCTestExpectation()

        sut.getQuotation(for: "***") { result in

            switch result {
            case .success(let quotation):
                let quotes = quotation.quotes ?? [:]
                XCTAssertTrue(quotation.success ?? false)
                XCTAssertEqual(quotes.count, 3)
                XCTAssertEqual(quotation.source ?? "", "USD")
                XCTAssertTrue(quotes.keys.contains("USDAED"))
                XCTAssertTrue(quotes.keys.contains("USDBRL"))
                XCTAssertTrue(quotes.keys.contains("USDBSD"))
                break

            case .failure:
                XCTFail("Unexpected error. It shout be success")
            }

            expectation.fulfill()

        }

        wait(for: [expectation], timeout: 10.0)
    }

    func testGetQuotationFail() {
        let error = NSError(domain: "Expected error", code: 555, userInfo: nil)
        let service = MockedRequestServiceAdapter(error: error)
        sut = CurrencyServiceWorker(service: service)
        let expectation = XCTestExpectation()

        sut.getQuotation(for: "USB") { result in

            switch result {
            case .success:
                XCTFail("Unexpected error. It shout get a fail")

            case .failure(let error as NSError):
                XCTAssertEqual(error.code, 555)
                XCTAssertEqual(error.domain, "Expected error")
            }

            expectation.fulfill()

        }

        wait(for: [expectation], timeout: 10.0)
    }
}
