//
//  JSONDecoder+Extensions.swift
//  Swapi
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import Foundation

extension JSONDecoder {

    /**
     To remove the step of first converting to Data before calling JSONDecoder.decode()
     */
    func decode<T: Decodable>(_ type: T.Type, from dictionary: [String: Any?]) -> T? {
        do {
            let data = try JSONSerialization.data(
                withJSONObject: dictionary,
                options: JSONSerialization.WritingOptions.prettyPrinted
            )
            return try decode(type, from: data)
        } catch {
            return nil
        }
    }
}
