//
//  CatRequest.swift
//  Pintecat
//
//  Created by John Lenon Souza dos Reis on 23/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import UIKit

struct CatResult: Codable {
    var data: [Cat]
    var success: Bool
    var status: Int
}
