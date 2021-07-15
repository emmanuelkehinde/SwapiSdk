//
//  PlanetApiModel.swift
//  Swapi
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import Foundation

struct PlanetApiModel: Codable {
    let name: String?
    let population: String?
    let climate: String?

    enum CodingKeys: String, CodingKey {
        case name
        case population
        case climate
    }
}

