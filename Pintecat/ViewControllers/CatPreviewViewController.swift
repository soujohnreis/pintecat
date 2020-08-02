//
//  CatPreviewViewController.swift
//  Pintecat
//
//  Created by John Lenon Souza dos Reis on 01/08/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import UIKit

class CatPreviewViewController: UIViewController {

    private let pictureView = UIImageView()
    
    override func loadView() {
        self.pictureView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view = self.pictureView
    }
    
    init(picture: UIImage) {
        super.init(nibName: nil, bundle: nil)
        self.pictureView.image = picture
        self.preferredContentSize = picture.size
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
