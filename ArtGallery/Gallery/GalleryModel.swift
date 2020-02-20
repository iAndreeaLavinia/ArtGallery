//
//  GalleryModel.swift
//  ArtGallery
//
//  Created by Andreea Lavinia Ionescu on 29/01/2020.
//  Copyright © 2020 Orange Labs Romania. All rights reserved.
//

import UIKit

class GalleryModel: Decodable {

    var name: String
    var level: Int
    var information: String
    var imageName: String
    var latitude: Double
    var longitude: Double

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case level = "level"
        case information = "information"
        case imageName = "imageName"
        case latitude = "latitude"
        case longitude = "longitude"
    }
        
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        level = try container.decode(Int.self, forKey: .level)
        information = try container.decode(String.self, forKey: .information)
        imageName = try container.decode(String.self, forKey: .imageName)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
    }
        
}
