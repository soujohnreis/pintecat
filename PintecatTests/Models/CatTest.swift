//
//  CatTest.swift
//  PintecatTests
//
//  Created by John Lenon Souza dos Reis on 25/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import XCTest

class CatTest: XCTestCase {

    func testShouldReturnLinkWhenHasntCover() {
        // given
        let cat = Cat(id: "1", title: "Cat title", link: "link://")
        
        // when
        let link = cat.directLink()
        
        // then
        XCTAssertEqual("link://", link)
    }
    
    func testShouldReturnDirectLinkWhenHasCover() {
        // given
        let cat = Cat(id: "1", title: "Cat title", cover: "qwerty", link: "link://")
        
        // when
        let link = cat.directLink()
        
        // then
        XCTAssertEqual("https://i.imgur.com/qwerty.jpg", link)
    }
    
}
