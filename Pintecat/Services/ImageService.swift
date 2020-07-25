//
//  ImageService.swift
//  Pintecat
//
//  Created by John Lenon Souza dos Reis on 23/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import Alamofire
import AlamofireImage

protocol ImageServiceProtocol {
    func downloadImage(from url: String, completion: @escaping (AFDataResponse<Image>) -> Void)
}

class ImageService: ImageServiceProtocol {
    // MARK: Methods
    func downloadImage(from url: String, completion: @escaping (AFDataResponse<Image>) -> Void) {
        AF.request(url).responseImage(completionHandler: completion)
    }
}
