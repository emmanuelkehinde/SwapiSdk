//
//  String+Extensions.swift
//  Demo
//
//  Created by Emmanuel Kehinde on 15/07/2021.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
