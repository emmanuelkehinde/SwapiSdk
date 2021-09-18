//
//  PlanetApiModelToPlanetPopulationMapperTests.swift
//  SwapiTests
//
//  Created by Emmanuel Kehinde on 15/07/2021.
//

import XCTest
@testable import Swapi

// swiftlint:disable type_name
class PlanetApiModelToPlanetPopulationMapperTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_planetApiModelToPlanetPopulation_shouldBeSuccessful() throws {
        let expectedPlanetPopulation = PlanetPopulation(
            population: "10000",
            planetName: "Tatooine",
            planetClimate: "Arid"
        )

        let planetApiModel = PlanetApiModel(name: "Tatooine", population: "10000", climate: "Arid")
        let actualPlanetPopulation = planetApiModel.mapToPlanetPopulation()

        XCTAssertEqual(expectedPlanetPopulation, actualPlanetPopulation)
    }
}
