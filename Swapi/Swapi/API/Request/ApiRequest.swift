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
    var bodyParameters: [String: Any]? = nil
    var queryParameters: [String: Any]? = nil
    var pathParameters: [String]? = nil

    enum Method: String {
        case get = "GET"
    }
}


