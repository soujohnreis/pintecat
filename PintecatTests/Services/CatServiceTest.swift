//
//  CatServiceTest.swift
//  PintecatTests
//
//  Created by John Lenon Souza dos Reis on 25/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import XCTest
import Cuckoo

class CatServiceTest: XCTest {

    var catService: MockCatServiceProtocol!
    
    override func setUp() {
        self.catService = MockCatServiceProtocol()
    }
    
    func testShouldReturnDirectLink() {
        // given
        stub(self.catService) { (stub) in
            when(stub.directExtension()).thenReturn(".png")
        }
        
        stub(self.catService) { (stub) in
            when(stub.directLink()).thenReturn("https://fakelink/")
        }
        
        // when
        let directLink = self.catService.directLink(to: "qwerty")
        
        // then
        XCTAssertEqual("https://fakelink/qwerty.png", directLink)
    }
}
