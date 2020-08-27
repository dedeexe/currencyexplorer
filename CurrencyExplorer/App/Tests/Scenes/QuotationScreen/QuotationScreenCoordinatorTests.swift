//
//  QuotationScreenCoordinatorTests.swift
//  CurrencyExplorerTests
//
//  Created by User on 8/26/20.
//  Copyright © 2020 User. All rights reserved.
//

import XCTest
@testable import CurrencyExplorer

class QuotationScreenCoordinatorTests: XCTestCase {

    let sut = QuotationScreenCoordinator()

    func testHasQuotationScreenViewController() throws {
        sut.start()
        XCTAssertNotNil(sut.viewController)
        XCTAssertTrue(sut.viewController is QuotationScreenViewController)
    }

    func testInternalView() throws {
        sut.start()
        guard let vc = sut.viewController as? QuotationScreenViewController else {
            XCTFail("Fail extracting viewcontroller")
            return
        }

        XCTAssertTrue(vc.internalView is QuotationScreenView)       //Yes. It's obvious, but somebody still can change it in code.
    }
}
