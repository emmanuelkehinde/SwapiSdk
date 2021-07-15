//
//  PlanetPopulation.swift
//  Swapi
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import Foundation

public struct PlanetPopulation {
    public let population: String
    public let planetName: String
    public let planetClimate: String
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

