//
//  Task.swift
//  Sweekly
//
//  Created by David Salmberg on 2024-02-07.
//

import Foundation

class Task: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}
