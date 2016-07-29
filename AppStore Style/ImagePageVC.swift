//
//  ImagePageVC.swift
//  AppStore Style
//
//  Created by Ahmed Elzohry on 7/29/16.
//  Copyright © 2016 Ahmed Elzohry. All rights reserved.
//

import UIKit

class ImagePageVC: UIViewController {
    
    var image: String? {
        didSet {
            loadData()
        }
    }
    
    var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .ScaleAspectFill
        iv.layer.masksToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        imageView.leftAnchor.constraintEqualToAnchor(view.leftAnchor).active = true
        imageView.rightAnchor.constraintEqualToAnchor(view.rightAnchor).active = true
        imageView.topAnchor.constraintEqualToAnchor(view.topAnchor).active = true
        imageView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor).active = true
        
        loadData()
    }
    
    private func loadData() {
        guard let image = image else { return }
        
        imageView.image = UIImage(named: image)
    }
}
