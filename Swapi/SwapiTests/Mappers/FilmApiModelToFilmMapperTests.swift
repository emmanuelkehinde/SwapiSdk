//
//  FilmApiModelToFilmMapperTests.swift
//  SwapiTests
//
//  Created by Emmanuel Kehinde on 15/07/2021.
//

import XCTest
@testable import Swapi

class FilmApiModelToFilmMapperTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_filmApiModelToFilm_shouldBeSuccessful() throws {
        let expectedDate = "1995-10-20".toDate(format: "yyyy/MM/dd")
        let expectedFilm = Film(
            title: "A New Hope",
            openingCrawl: "It is a period of Civil War",
            releaseDate: expectedDate
        )

        let filmApiModel = FilmApiModel(
            title: "A New Hope",
            openingCrawl: "It is a period of Civil War",
            releaseDate: "1995-10-20"
        )
        let actualFilm = filmApiModel.mapToFilm()

        XCTAssertEqual(expectedFilm.title, actualFilm.title)
        XCTAssertEqual(expectedFilm.openingCrawl, actualFilm.openingCrawl)
        XCTAssertEqual(expectedFilm.releaseDate, actualFilm.releaseDate)
    }
}
