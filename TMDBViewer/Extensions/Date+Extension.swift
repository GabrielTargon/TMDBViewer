//
//  Date+Extension.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 20/10/22.
//

import Foundation

extension Date {
    
    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
