//
//  Task.swift
//  Sweekly
//
//  Created by David Salmberg on 2024-02-07.
//

import Foundation

class Task: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var description: String
    var completed: Bool

    init(title: String, description: String) {
        self.title = title
        self.description = description
        self.completed = false
    }

    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

