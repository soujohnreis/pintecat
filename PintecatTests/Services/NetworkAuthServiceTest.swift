//
//  NetworkAuthServiceTest.swift
//  PintecatTests
//
//  Created by John Lenon Souza dos Reis on 25/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import XCTest

class NetworkAuthServiceTest: XCTest {
    
    func testShouldReturnAuthHeaders() {
        // given
        let networkAuthService = NetworkAuthService()
        
        // when
        let headers = networkAuthService.buildHeaders()
        
        // then
        XCTAssertNotNil(headers["Authorization"])
        XCTAssertNotNil(headers["Content-Type"])
    }
    
}
