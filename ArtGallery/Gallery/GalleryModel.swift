//
//  GalleryModel.swift
//  ArtGallery
//
//  Created by Andreea Lavinia Ionescu on 29/01/2020.
//  Copyright © 2020 Orange Labs Romania. All rights reserved.
//

import UIKit

class GalleryModel: NSObject {

    var name: String
    var level: Int
    var information: String
    var imageName: String
    
    init(name: String, level: Int, information: String, imageName: String) {
        self.name = name
        self.level = level
        self.information = information
        self.imageName = imageName
    }
}
