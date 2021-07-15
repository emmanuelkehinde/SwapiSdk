//
//  String+Extensions.swift
//  Swapi
//
//  Created by Emmanuel Kehinde on 14/07/2021.
//

import Foundation

extension String {
    func toDate(format: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
       return formatter.date(from: self) ?? Date()
    }
}
