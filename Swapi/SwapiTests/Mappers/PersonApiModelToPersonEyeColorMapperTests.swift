//
//  PersonApiModelToPersonEyeColorMapperTests.swift
//  SwapiTests
//
//  Created by Emmanuel Kehinde on 15/07/2021.
//

import XCTest
@testable import Swapi

// swiftlint:disable type_name
class PersonApiModelToPersonEyeColorMapperTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_personApiModelToPersonEyeColor_shouldBeSuccessful() throws {
        let expectedPersonEyeColor = PersonEyeColor(eyeColor: "Brown", personName: "Luke")

        let personApiModel = PersonApiModel(name: "Luke", eyeColor: "Brown")
        let actualPersonEyeColor = personApiModel.mapToPersonEyeColor()

        XCTAssertEqual(expectedPersonEyeColor.eyeColor, actualPersonEyeColor.eyeColor)
        XCTAssertEqual(expectedPersonEyeColor.personName, actualPersonEyeColor.personName)
    }
}
