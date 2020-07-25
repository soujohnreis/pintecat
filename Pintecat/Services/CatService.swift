//
//  CatService.swift
//  Pintecat
//
//  Created by John Lenon Souza dos Reis on 25/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import Foundation

protocol CatServiceProtocol {
    func directLink() -> String
    func directExtension() -> String
    func directLink(to cover: String) -> String
}

class CatService: CatServiceProtocol {

    func directLink() -> String {
        return "https://i.imgur.com/"
    }
    
    func directExtension() -> String {
        return ".jpg"
    }
    
    func directLink(to cover: String) -> String {
        return "\(self.directLink())\(cover)\(self.directExtension())"
    }
    
}
