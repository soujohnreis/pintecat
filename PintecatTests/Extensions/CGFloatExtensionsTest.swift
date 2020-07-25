//
//  CGFloatExtensionsTest.swift
//  PintecatTests
//
//  Created by John Lenon Souza dos Reis on 24/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import XCTest

class CGFloatExtensionsTest: XCTestCase {

    func testShouldIncreaseValueByPercent() {
        XCTAssertEqual(CGFloat(110), CGFloat(100).increase(by: CGFloat(10)))
        XCTAssertEqual(CGFloat(1000), CGFloat(500).increase(by: CGFloat(100)))
    }
    
    func testShouldDecreaseValueByPercent() {
        XCTAssertEqual(CGFloat(90), CGFloat(100).decrease(by: CGFloat(10)))
        XCTAssertEqual(CGFloat(0), CGFloat(500).decrease(by: CGFloat(100)))
    }
    
}
