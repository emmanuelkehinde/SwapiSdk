//
//  SwapiClient.swift
//  Swapi
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import Foundation

public class SwapiClient {
    private var apiClient: ApiClientProtocol?

    init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }

    public convenience init() {
        let swapiDiContainer = SwapiDIContainer()
        self.init(apiClient: swapiDiContainer.apiClient)
    }

    public func getEyeColors(onSuccess: @escaping ([PersonEyeColor]) -> Void, onFailure: @escaping (SwapiError) -> Void) {
        apiClient?.getPeople(completion: { result in
            switch result {
            case .success(let people):
                onSuccess(
                    Array(people.map { $0.mapToPersonEyeColor() }.prefix(5))
                )
            case .failure(let error):
                onFailure(error.mapToSwapiError())
            }
        })
    }

    public func getPlanetsPopulation(onSuccess: @escaping ([PlanetPopulation]) -> Void, onFailure: @escaping (SwapiError) -> Void) {
        apiClient?.getPlanets(completion: { result in
            switch result {
            case .success(let planets):
                onSuccess(
                    Array(planets.map { $0.mapToPlanetPopulation() }.prefix(5))
                )
            case .failure(let error):
                onFailure(error.mapToSwapiError())
            }
        })
    }

    public func getFilms(onSuccess: @escaping ([Film]) -> Void, onFailure: @escaping (SwapiError) -> Void) {
        apiClient?.getFilms(completion: { result in
            switch result {
            case .success(let films):
                onSuccess(
                    films.map { $0.mapToFilm() }
                )
            case .failure(let error):
                onFailure(error.mapToSwapiError())
            }
        })
    }
}
