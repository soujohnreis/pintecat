//
//  CGSizeExtensionsTest.swift
//  PintecatTests
//
//  Created by John Lenon Souza dos Reis on 24/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import XCTest

class CGSizeExtensionsTest: XCTestCase {
    
    func testShouldCalculateProportionWithWidthGreaterThenHeight() {
        let size = CGSize.sizeProportion(maxWidth: 100, withGivenWidth: 1000, andHeight: 900)
        XCTAssertEqual(CGFloat(100), size.width)
        XCTAssertEqual(CGFloat(90), size.height)
    }
    
    func testShouldCalculateProportionWithHeightGreaterThenWidth() {
        let size = CGSize.sizeProportion(maxWidth: 100, withGivenWidth: 900, andHeight: 1000)
        XCTAssertEqual(CGFloat(100), size.width)
        XCTAssertEqual(CGFloat(110), size.height)
    }
    
    func testShouldCalculateProportionWithSameWidthAndHeightWhenGivenEqualValues() {
        let size = CGSize.sizeProportion(maxWidth: 100, withGivenWidth: 1000, andHeight: 1000)
        XCTAssertEqual(CGFloat(100), size.width)
        XCTAssertEqual(CGFloat(100), size.height)
    }
}
