//
//  Cat.swift
//  Pintecat
//
//  Created by John Lenon Souza dos Reis on 23/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import Foundation

struct Cat: Codable {
    // MARK: Properties
    var id: String
    var title: String
    var cover: String?
    var coverWidth: Double?
    var coverHeight: Double?
    var link: String
    
    var catService: CatServiceProtocol = CatService()
    
    // MARK: Methods
    func directLink()-> String {
        if let cover = self.cover {
            return self.catService.directLink(to: cover)
        }
        
        return self.link
    }
    
    mutating func setCatService(_ catService: CatServiceProtocol) {
        self.catService = catService
    }
    
    
    // MARK: Keys
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case cover
        case coverWidth = "cover_width"
        case coverHeight = "cover_height"
        case link
    }
}
