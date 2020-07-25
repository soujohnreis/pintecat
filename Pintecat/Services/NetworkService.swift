//
//  NetworkService.swift
//  Pintecat
//
//  Created by John Lenon Souza dos Reis on 23/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import Alamofire

enum NetworkUrlType: String {
    case cats
}

protocol NetworkServiceProtocol {
    func fetchCats(page: Int, completion: @escaping (DataResponse<CatResult, AFError>) -> Void)
}

class NetworkService: NetworkServiceProtocol {

    // MARK: Properties
    fileprivate let baseURL = "https://api.imgur.com/3/gallery/search/time/all"
    var networkAuthService: NetworkAuthServiceProtocol
    
    // MARK: Initializers
    init(networkAuthService: NetworkAuthServiceProtocol = NetworkAuthService()) {
        self.networkAuthService = networkAuthService
    }
    
    // MARK: Methods
    private func buildSearchURL(page: Int, type: NetworkUrlType) -> URL {
        return URL(string: "\(self.baseURL)/\(page)?q=\(type.rawValue)")!
    }
    
    func fetchCats(page: Int = 0, completion: @escaping (DataResponse<CatResult, AFError>) -> Void) {
        AF.request(self.buildSearchURL(page: page, type: .cats), headers: self.networkAuthService.buildHeaders())
            .responseDecodable(of: CatResult.self, completionHandler: completion)
    }
}
