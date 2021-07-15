//
//  PersonApiModel.swift
//  Swapi
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import Foundation

struct PersonApiModel: Codable {
    let name: String?
    let eyeColor: String?

    enum CodingKeys: String, CodingKey {
        case name
        case eyeColor = "eye_color"
    }
}
