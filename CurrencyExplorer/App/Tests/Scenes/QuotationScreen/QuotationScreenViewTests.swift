import Foundation

import XCTest
import SnapshotTesting
@testable import CurrencyExplorer

class QuotationScreenViewTests: XCTestCase {

    let sut = QuotationScreenView()
    let recordSnapshot = false

    func testDefaultSnapshot() throws {
        sut.frame = CGRect(x: 0, y: 0, width: 400, height: 800)
        sut.show(quotes: createQuotes(), amount: 12.34)
        assertSnapshot(matching: sut, as: .image, record: recordSnapshot)
    }

    func createQuotes() -> [QuoteInfo] {
        return [
        .init(symbol: "USDEUR", value: 0.845025, country: "Euro", selected: false),
        .init(symbol: "USDGBP", value: 0.756585, country: "British Pound Sterling", selected: false),
        .init(symbol: "USDCAD", value: 1.313585, country: "Canadian Dollar", selected: false),
        .init(symbol: "USDPLN", value: 3.73474, country: "Polish Zloty", selected: true),
        .init(symbol: "USDBRL", value: 5.592975, country: "Brazilian Real", selected: false),
        ]
    }
}

