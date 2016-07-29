//
//  ImageCell.swift
//  AppStore Style
//
//  Created by Ahmed Elzohry on 7/29/16.
//  Copyright © 2016 Ahmed Elzohry. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {

    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        itemImageView.layer.cornerRadius = 10.0
        itemImageView.layer.masksToBounds = true
    }

}
