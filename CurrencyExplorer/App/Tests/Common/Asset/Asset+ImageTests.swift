import XCTest
@testable import CurrencyExplorer

class Asset_ImageTests: XCTestCase {

    func testValidPlaceHolder() throws {
        XCTAssertNotNil(Asset.Image.placeholder.resource)
    }

}
