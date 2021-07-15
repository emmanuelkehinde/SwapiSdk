//
//  PersonEyeColor.swift
//  Swapi
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import Foundation

public struct PersonEyeColor {
    public let eyeColor: String
    public let personName: String
}

extension PersonApiModel {
    func mapToPersonEyeColor() -> PersonEyeColor {
        PersonEyeColor(
            eyeColor: eyeColor ?? "",
            personName: name ?? ""
        )
    }
}

