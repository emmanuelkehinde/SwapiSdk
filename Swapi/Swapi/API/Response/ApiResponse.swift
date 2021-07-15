//
//  ApiResponse.swift
//  Swapi
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import Foundation

class ApiResponse<T: Decodable>: Decodable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: T?

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try? values.decode(Int.self, forKey: CodingKeys.count)
        self.next = try? values.decode(String.self, forKey: CodingKeys.next)
        self.previous = try? values.decode(String.self, forKey: CodingKeys.previous)

        do {
            self.results = try values.decode(T.self, forKey: CodingKeys.results)
        } catch {
        }
    }

    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
}
