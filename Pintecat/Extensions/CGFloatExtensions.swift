//
//  DoubleExtensions.swift
//  Pintecat
//
//  Created by John Lenon Souza dos Reis on 24/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import UIKit

extension CGFloat {
    func increase(by percent: CGFloat) -> CGFloat {
        return self + (self * abs(percent) / 100)
    }
    func decrease(by percent: CGFloat) -> CGFloat {
        return self - (self * (abs(percent) / 100))
    }
}
