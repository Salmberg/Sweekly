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
    var hour: Int
    var minute: Int
    var completed: Bool

    init(title: String, description: String, hour: Int, minute: Int) {
        self.title = title
        self.description = description
        self.hour = hour
        self.minute = minute
        self.completed = false
    }

    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    var timeString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        if let date = Calendar.current.date(bySettingHour: hour, minute: minute, second: 0, of: Date()) {
            return formatter.string(from: date)
        }
        return ""
    }
}


