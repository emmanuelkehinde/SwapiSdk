//
//  PersonEyeColor.swift
//  Swapi
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import Foundation

public struct PersonEyeColor: Equatable {
    public let eyeColor: String
    public let personName: String

    public static func == (lhs: PersonEyeColor, rhs: PersonEyeColor) -> Bool {
        return lhs.eyeColor == rhs.eyeColor && lhs.personName == rhs.personName
    }
}

extension PersonApiModel {
    func mapToPersonEyeColor() -> PersonEyeColor {
        PersonEyeColor(
            eyeColor: eyeColor ?? "",
            personName: name ?? ""
        )
    }
}
