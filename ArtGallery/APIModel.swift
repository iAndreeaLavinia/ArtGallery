//
//  APIModel.swift
//  ArtGallery
//
//  Created by Andreea Lavinia Ionescu on 20/02/2020.
//  Copyright © 2020 Orange Labs Romania. All rights reserved.
//

import Foundation

typealias GalleryApiListCallback = (([GalleryModel]?, Bool) -> Void)

protocol GalleryApiProtocol {
    func getGalleries(_ onResult: @escaping GalleryApiListCallback)
}

class APIModel: GalleryApiProtocol {
    
    func getGalleries(_ onResult: @escaping GalleryApiListCallback) {
        let url = URL(string: "https://")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let parameters: [String: Any] = [
            "code": 100,
        ]

        request.httpBody = parameters.percentEscaped().data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil || data == nil {
                print("Error!")
                onResult(nil, false)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Server error!")
                onResult(nil, false)
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                onResult(nil, false)
                return
            }
            
            do {
                let galeriesList = try JSONDecoder().decode(GalleryModel.self, from: data!)
                onResult([galeriesList], true)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }

}


