//
//  UIColor+ExtensionsTests.swift
//  CurrencyExplorerTests
//
//  Created by User on 8/26/20.
//  Copyright © 2020 User. All rights reserved.
//

import XCTest
@testable import CurrencyExplorer

class UIColor_ExtensionsTests: XCTestCase {
    func testInitlizerRed() throws {
        let color01 = UIColor.red
        let color02 = UIColor(red: 255, green: 0, blue: 0)
        let color03 = UIColor(literal: 0xff0000)
        let color04 = UIColor.blue

        XCTAssertEqual(color01, color02)
        XCTAssertEqual(color01, color03)
        XCTAssertEqual(color02, color03)
        XCTAssertNotEqual(color01, color04)
        XCTAssertNotEqual(color02, color04)
        XCTAssertNotEqual(color03, color04)
    }

    func testInitlizerGreen() throws {
        let color01 = UIColor.green
        let color02 = UIColor(red: 0, green: 255, blue: 0)
        let color03 = UIColor(literal: 0x00ff00)
        let color04 = UIColor.blue

        XCTAssertEqual(color01, color02)
        XCTAssertEqual(color01, color03)
        XCTAssertEqual(color02, color03)
        XCTAssertNotEqual(color01, color04)
        XCTAssertNotEqual(color02, color04)
        XCTAssertNotEqual(color03, color04)
    }

    func testInitlizerBlue() throws {
        let color01 = UIColor.blue
        let color02 = UIColor(red: 0, green: 0, blue: 255)
        let color03 = UIColor(literal: 0x0000ff)
        let color04 = UIColor.red

        XCTAssertEqual(color01, color02)
        XCTAssertEqual(color01, color03)
        XCTAssertEqual(color02, color03)
        XCTAssertNotEqual(color01, color04)
        XCTAssertNotEqual(color02, color04)
        XCTAssertNotEqual(color03, color04)
    }
}
