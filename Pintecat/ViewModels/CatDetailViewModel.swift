//
//  CatDetailViewModel.swift
//  Pintecat
//
//  Created by John Lenon Souza dos Reis on 01/08/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CatDetailViewModel {
    // MARK: Properties
    let cat: Cat
    let picture: UIImage
    
    // MARK: Initializers
    init(cat: Cat, picture: UIImage) {
        self.cat = cat
        self.picture = picture
    }
}
