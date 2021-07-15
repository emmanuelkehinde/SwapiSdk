//
//  Date+Extensions.swift
//  Demo
//
//  Created by Emmanuel Kehinde on 15/07/2021.
//

import Foundation

extension Date {
    func toString(format: String = "yyyy/MM/dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
