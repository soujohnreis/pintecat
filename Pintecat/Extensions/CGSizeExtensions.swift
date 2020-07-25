//
//  CGSizeExtensions.swift
//  Pintecat
//
//  Created by John Lenon Souza dos Reis on 24/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import UIKit

extension CGSize {
    
    /*
     * Calculate height proportion to max width with given new width and height
     */
    static func sizeProportion(maxWidth: CGFloat, withGivenWidth givenWidth: CGFloat, andHeight givenHeight: CGFloat) -> CGSize {
        
        let greaterOperand = givenWidth >= givenHeight ? givenWidth : givenHeight
        let lowerOperand = givenWidth <= givenHeight ? givenWidth : givenHeight
        
        let decrease = greaterOperand - lowerOperand
        let percent: CGFloat = decrease / greaterOperand * 100
        
        var height = maxWidth.decrease(by: percent)
        
        if greaterOperand == givenHeight {
            height = maxWidth.increase(by: percent)
        }
        
        return CGSize(width: maxWidth, height: height)
    }
    
}
