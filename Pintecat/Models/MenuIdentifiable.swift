//
//  MenuIdentifiable.swift
//  Pintecat
//
//  Created by John Lenon Souza dos Reis on 01/08/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import Foundation
import UIKit

protocol MenuIdentifiable {
    var id: String { get }
}

extension MenuIdentifiable {
    var menuID: NSString {
        NSString(string: self.id)
    }
    
    func isReferenced(by configuration: UIContextMenuConfiguration) -> Bool {
        return self.menuID == configuration.identifier as? NSString
    }
}

extension Array where Element: MenuIdentifiable {
    func item(for configuration: UIContextMenuConfiguration) -> Element? {
        return first(where: { $0.menuID == configuration.identifier as? NSString })
    }
    
    func index(for configuration: UIContextMenuConfiguration) -> Index? {
        return firstIndex(where: { $0.menuID == configuration.identifier as? NSString } )
    }
}
