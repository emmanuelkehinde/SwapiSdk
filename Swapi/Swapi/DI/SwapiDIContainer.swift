//
//  SwapiDIContainer.swift
//  Swapi
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import Foundation

class SwapiDIContainer {
    lazy var urlSession: URLSession = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        return URLSession(configuration: config)
    }()

    lazy var apiClient: ApiClient = {
        ApiClient(urlSession: urlSession)
    }()
}
