//
//  PlanetPopulation.swift
//  Swapi
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import Foundation

public struct PlanetPopulation: Equatable {
    public let population: String
    public let planetName: String
    public let planetClimate: String

    public static func == (lhs: PlanetPopulation, rhs: PlanetPopulation) -> Bool {
        return lhs.population == rhs.population &&
            lhs.planetName == rhs.planetName &&
            lhs.planetClimate == rhs.planetClimate
    }
}

extension PlanetApiModel {
    func mapToPlanetPopulation() -> PlanetPopulation {
        PlanetPopulation(
            population: population ?? "",
            planetName: name ?? "",
            planetClimate: climate ?? ""
        )
    }
}
