//
//  Film.swift
//  Swapi
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import Foundation

public struct Film: Equatable {
    public let title: String
    public let openingCrawl: String
    public let releaseDate: Date?

    public static func == (lhs: Film, rhs: Film) -> Bool {
        return lhs.title == rhs.title && lhs.openingCrawl == rhs.openingCrawl && lhs.releaseDate == rhs.releaseDate
    }
}

extension FilmApiModel {
    func mapToFilm() -> Film {
        Film(
            title: title ?? "",
            openingCrawl: openingCrawl ?? "",
            releaseDate: releaseDate?.toDate(format: "yyyy-MM-dd")
        )
    }
}
