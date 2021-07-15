//
//  SwapiError.swift
//  Swapi
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import Foundation

public enum SwapiError: Error, LocalizedError {
    case badRequestData
    case customError(message: String)
    case unknownError

    public var errorDescription: String? {
        switch self {
        case .badRequestData:
            return "Invalid parameters passed"
        case .customError(let message):
            return message
        case .unknownError:
            return "Something went wrong"
        }
    }

}
