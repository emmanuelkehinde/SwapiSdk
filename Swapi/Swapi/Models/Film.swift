//
//  Film.swift
//  Swapi
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import Foundation

public struct Film {
    public let title: String
    public let openingCrawl: String
    public let releaseDate: Date
}

extension FilmApiModel {
    func mapToFilm() -> Film {
        Film(
            title: title ?? "",
            openingCrawl: openingCrawl ?? "",
            releaseDate: releaseDate?.toDate(format: "yyyy-MM-dd") ?? Date()
        )
    }
}
