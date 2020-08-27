//
//  QuoteViewTests.swift
//  CurrencyExplorerTests
//
//  Created by User on 8/26/20.
//  Copyright © 2020 User. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import CurrencyExplorer


class QuoteViewTests: XCTestCase {
    let sut = QuoteView()
    let recordSnapshot = false

    func testNotSelected() throws {
        sut.frame = CGRect(x: 0, y: 0, width: 250, height: 60)
        sut.currency = "JPY"
        sut.descriptionText = "Japan"
        sut.isMarked = false
        sut.value = "100.000,00"
        assertSnapshot(matching: sut, as: .image, record: recordSnapshot)
    }

    func testSelected() throws {
        sut.frame = CGRect(x: 0, y: 0, width: 250, height: 60)
        sut.currency = "JPY"
        sut.descriptionText = "Japan"
        sut.isMarked = true
        sut.value = "100.000,00"
        assertSnapshot(matching: sut, as: .image, record: recordSnapshot)
    }
}
