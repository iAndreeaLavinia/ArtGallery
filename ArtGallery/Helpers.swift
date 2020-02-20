//
//  Helpers.swift
//  ArtGallery
//
//  Created by Andreea Lavinia Ionescu on 20/02/2020.
//  Copyright © 2020 Orange Labs Romania. All rights reserved.
//

import Foundation

extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            return escapedKey + "=" + escapedValue
            }
            .joined(separator: "&")
    }
}
