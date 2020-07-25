//
//  NetworkServiceAuth.swift
//  Pintecat
//
//  Created by John Lenon Souza dos Reis on 25/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import Foundation

protocol NetworkServiceAuthProtocol {
    func buildHeaders() -> [String: String]
}

class NetworkAuthService: NetworkServiceAuthProtocol {

    func buildHeaders() -> [String: String] {
        return [
            "Authorization": "Client-ID 1ceddedc03a5d71",
            "Content-Type": "application/json"
        ]
    }
    
}
