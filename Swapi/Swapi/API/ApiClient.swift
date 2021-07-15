//
//  ApiClient.swift
//  Swapi
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import Foundation

protocol ApiClientProtocol {
    func getPeople(completion: @escaping (Result<[PersonApiModel], Error>) -> Void)
    func getPlanets(completion: @escaping (Result<[PlanetApiModel], Error>) -> Void)
    func getFilms(completion: @escaping (Result<[FilmApiModel], Error>) -> Void)
}

class ApiClient: ApiClientProtocol {
    private var urlSession: URLSession?

    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }

    func getPeople(completion: @escaping (Result<[PersonApiModel], Error>) -> Void) {
        let request = ApiService.getPeople.request
        makeRequest(apiRequest: request, responseType: [PersonApiModel].self, completion: { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                let apiError = (error as? ApiError) ?? .unknownError
                switch apiError {
                case .emptyResponseData, .unDecodableResponse:
                    completion(.success([]))
                    return
                default: break
                }

                completion(.failure(error))
            }
        })
    }

    func getPlanets(completion: @escaping (Result<[PlanetApiModel], Error>) -> Void) {
        let request = ApiService.getPlanets.request
        makeRequest(apiRequest: request, responseType: [PlanetApiModel].self, completion: { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                let apiError = (error as? ApiError) ?? .unknownError
                switch apiError {
                case .emptyResponseData, .unDecodableResponse:
                    completion(.success([]))
                    return
                default: break
                }

                completion(.failure(error))
            }
        })
    }

    func getFilms(completion: @escaping (Result<[FilmApiModel], Error>) -> Void) {
        let request = ApiService.getFilms.request
        makeRequest(apiRequest: request, responseType: [FilmApiModel].self, completion: { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                let apiError = (error as? ApiError) ?? .unknownError
                switch apiError {
                case .emptyResponseData, .unDecodableResponse:
                    completion(.success([]))
                    return
                default: break
                }

                completion(.failure(error))
            }
        })
    }

    enum Constants {
        static var baseUrl = "https://swapi.dev/api/"
    }
}

extension ApiClient {
    func makeRequest<T: Decodable>(
        apiRequest: ApiRequest,
        responseType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard var urlComponents = URLComponents(string: Constants.baseUrl + apiRequest.path) else {
            completion(.failure(ApiError.badUrl))
            return
        }

        if apiRequest.method == .get {
            // Add Query Params
            urlComponents.queryItems = apiRequest.queryParameters?.map { (key, value) -> URLQueryItem in
                return URLQueryItem(name: key, value: "\(value)")
            }
        }

        guard let url = urlComponents.url else {
            completion(.failure(ApiError.badUrl))
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = apiRequest.method.rawValue

        let task = urlSession?.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(error!))
                }
                return
            }

            guard let content = data else {
                DispatchQueue.main.async {
                    completion(.failure(error ?? ApiError.emptyResponseData))
                }
                return
            }

            let serializedData: T? = self.getSerializedData(content)
            DispatchQueue.main.async {
                if let serializedData = serializedData {
                    completion(.success(serializedData))
                } else {
                    completion(.failure(ApiError.unDecodableResponse))
                }
            }

        }
        task?.resume()
    }

    private func getSerializedData<T: Decodable>(_ data: Data) -> T? {
        do {
            guard let rawDict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],
                let response = JSONDecoder().decode(ApiResponse<T>.self, from: rawDict) else {
                    return nil
            }

            guard let results = response.results else {
                return nil
            }

            return results
        }
        catch {
            return nil
        }
    }
}
