//
//  GalleryViewModel.swift
//  ArtGallery
//
//  Created by Andreea Lavinia Ionescu on 29/01/2020.
//  Copyright © 2020 Orange Labs Romania. All rights reserved.
//

import UIKit

class GalleryViewModel {
    
    var levelsList: [GalleryModel] = [GalleryModel]()
    
    /*
     Creates an array of GalleryModels
     */
    func createMockData() {
        let firstGallery = GalleryModel(name: "Paintings",
                                        level: 1,
                                        information: "Painting taken literally is the practice of applying pigment suspended in a carrier (or medium) and a binding agent (a glue) to a surface (support) such as paper, canvas or a wall. However, when used in an artistic sense it means the use of this activity in combination with drawing, composition, or other aesthetic considerations in order to manifest the expressive and conceptual intention of the practitioner. Painting is also used to express spiritual motifs and ideas; sites of this kind of painting range from artwork depicting mythological figures on pottery to The Sistine Chapel to the human body itself.",
                                        imageName: "paintings")
        
        let secondGallery = GalleryModel(name: "Sculptures",
                                         level: 2,
                                         information: "Sculpture is three-dimensional artwork created by shaping or combining hard or plastic material, sound, or text and or light, commonly stone (either rock or marble), clay, metal, glass, or wood. Some sculptures are created directly by finding or carving; others are assembled, built together and fired, welded, molded, or cast. Sculptures are often painted.[20] A person who creates sculptures is called a sculptor.",
                                         imageName: "sculptures")

        /*
         Add a single element in the array. Attention! Be sure that your array is first initialized "[GalleryModel]()"
        levelsList.append(firstGallery)
         */
        levelsList = [firstGallery, secondGallery]
    }

}
