//
//  Item.swift
//  AppStore Style
//
//  Created by Ahmed Elzohry on 7/29/16.
//  Copyright © 2016 Ahmed Elzohry. All rights reserved.
//

import Foundation

class Item: NSObject {
    var title: String = ""
    var imageName: String = ""
    
    override init() {
        super.init()
    }
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}