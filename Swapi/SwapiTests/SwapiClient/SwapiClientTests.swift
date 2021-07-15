//
//  SwapiClientTests.swift
//  SwapiTests
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import XCTest
@testable import Swapi

class SwapiClientTests: XCTestCase {
    private var swapiClient: SwapiClient!

    override func setUpWithError() throws {
        let apiClientMock = ApiClientMock()
        swapiClient = SwapiClient(apiClient: apiClientMock)
    }

    override func tearDownWithError() throws {
        swapiClient = nil
    }

    func test_getEyeColors_shouldBeSuccessful() throws {
        swapiClient.getEyeColors { people in
            XCTAssertEqual(people.count, 1)
        } onFailure: { _ in
            XCTFail("Failed to get eye colors")
        }
    }

    func test_getPlanetsPopulation_shouldBeSuccessful() throws {
        swapiClient.getPlanetsPopulation { planets in
            XCTAssertEqual(planets.count, 1)
        } onFailure: { _ in
            XCTFail("Failed to get planets population")
        }
    }

    func test_getFilms_shouldBeSuccessful() throws {
        swapiClient.getFilms { films in
            XCTAssertEqual(films.count, 1)
        } onFailure: { _ in
            XCTFail("Failed to get films")
        }
    }
}

class ApiClientMock: ApiClientProtocol {
    func getPeople(completion: @escaping (Result<[PersonApiModel], Error>) -> Void) {
        completion(.success([PersonApiModel(name: "Gary", eyeColor: "brown")]))
    }

    func getPlanets(completion: @escaping (Result<[PlanetApiModel], Error>) -> Void) {
        completion(.success([PlanetApiModel(name: "Tatooine", population: "100", climate: "arid")]))
    }

    func getFilms(completion: @escaping (Result<[FilmApiModel], Error>) -> Void) {
        completion(.success([FilmApiModel(title: "Star Wars", openingCrawl: "Blah blah", releaseDate: "2021-07-14")]))
    }
}
