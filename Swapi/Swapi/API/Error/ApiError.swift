//
//  ApiError.swift
//  Swapi
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import Foundation

enum ApiError: Error, LocalizedError {
    case badRequestData
    case badUrl
    case endpointError(message: String)
    case emptyResponseData
    case unDecodableResponse
    case unknownError

    public var errorDescription: String? {
        switch self {
        case .badRequestData:
            return "The correct data could not be sent"
        case .badUrl:
            return "Incorrect destination"
        case .endpointError(let message):
            return message
        case .emptyResponseData:
            return "Response is empty"
        case .unDecodableResponse:
            return "The response could not be decoded"
        case .unknownError:
            return "An error occurred"
        }
    }
}

extension Error {
    func mapToSwapiError() -> SwapiError {
        let apiError = (self as? ApiError) ?? .unknownError

        switch apiError {
        case .badRequestData:
            return SwapiError.badRequestData
        case .endpointError(let message):
            return SwapiError.customError(message: message)
        default:
            return SwapiError.unknownError
        }
    }
}
