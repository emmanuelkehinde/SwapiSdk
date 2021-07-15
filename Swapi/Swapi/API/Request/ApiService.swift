//
//  ApiService.swift
//  Swapi
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import Foundation

enum ApiService {
    case getPeople
    case getPlanets
    case getFilms

    var request: ApiRequest {
        switch self {
        case .getPeople:
            return ApiRequest(path: "people", method: .get)
        case .getPlanets:
            return ApiRequest(path: "planets", method: .get)
        case .getFilms:
            return ApiRequest(path: "films", method: .get)
        }
    }
}
