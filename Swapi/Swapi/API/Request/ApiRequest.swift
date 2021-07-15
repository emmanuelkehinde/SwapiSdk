//
//  ApiRequest.swift
//  Swapi
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import Foundation

struct ApiRequest {
    let path: String
    let method: Method
    var bodyParameters: [String: Any]?
    var queryParameters: [String: Any]?
    var pathParameters: [String]?

    enum Method: String {
        case get = "GET"
    }
}
