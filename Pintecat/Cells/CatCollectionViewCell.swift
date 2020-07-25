//
//  CatCollectionViewCell.swift
//  Pintecat
//
//  Created by John Lenon Souza dos Reis on 23/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import UIKit
import SkeletonView

class CatCollectionViewCell: UICollectionViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var picture: UIImageView!
    
    // MARK: Methods
    override func prepareForReuse() {
        super.prepareForReuse()
        self.picture.image = nil
    }
    
    func setPicture(_ picture: UIImage?) {
        picture == nil ? self.picture.showAnimatedSkeleton() : self.picture.hideSkeleton()
        self.picture.contentMode = .scaleAspectFill
        self.picture.image = picture
    }
}
