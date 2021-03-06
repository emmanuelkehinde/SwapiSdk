//
//  FilmApiModel.swift
//  Swapi
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import Foundation

struct FilmApiModel: Codable {
    let title: String?
    let openingCrawl: String?
    let releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case title
        case openingCrawl = "opening_crawl"
        case releaseDate = "release_date"
    }
}
