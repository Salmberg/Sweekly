//
//  Day.swift
//  Sweekly
//
//  Created by David Salmberg on 2024-02-07.
//

import Foundation


struct Day: Identifiable {
    var id: Date { date }
    var name: String
    var date: Date
    var tasks: [Task]
    
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d" // "d" ger dagens nummer
        return formatter.string(from: date)
    }
}
