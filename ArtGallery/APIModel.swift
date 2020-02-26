//
//  APIModel.swift
//  ArtGallery
//
//  Created by Andreea Lavinia Ionescu on 20/02/2020.
//  Copyright © 2020 Orange Labs Romania. All rights reserved.
//

import Foundation

typealias GalleryApiListCallback = (([GalleryModel]?, Bool) -> Void)

protocol GalleryApiProtocol: class {
    func didGetGalleries(galleries: [GalleryModel]?)
}

class APIModel {

    weak var delegate: GalleryApiProtocol?
    
    func getGalleries(_ onResult: @escaping GalleryApiListCallback) {
        let url = URL(string: "https://yourURL.com")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let parameters: [String: Any] = [
            "code": 100,
        ]

        request.httpBody = parameters.percentEscaped().data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil || data == nil {
                print("Error!")
               // Mock data
                self.parseMockData { (galleries, succeeded) in
                    onResult(galleries, succeeded)
                }
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Server error!")
                // Mock data
                self.parseMockData { (galleries, succeeded) in
                    onResult(galleries, succeeded)
                }
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                // Mock data
                self.parseMockData { (galleries, succeeded) in
                    onResult(galleries, succeeded)
                }
                return
            }
            //Success code
        }
        
        task.resume()
    }
    
    func parseMockData(_ onResult: @escaping GalleryApiListCallback) {
        // We get data from our local mock JSON file
        guard let mockData = self.getDataFromMockJSON() else {
            onResult(nil, false)
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let galeriesList = try decoder.decode([GalleryModel].self, from: mockData)
            self.delegate?.didGetGalleries(galleries: galeriesList)
            onResult(galeriesList, true)
        } catch {
            print("JSON error: \(error.localizedDescription)")
            onResult(nil, false)
        }
    }
    
    func getDataFromMockJSON() -> Data? {
        guard let path = Bundle.main.path(forResource: "galleries", ofType: "json") else {
            return nil
        }
        do {
          let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            return data
      } catch {
        // handle error
        return nil
      }
    }

}


