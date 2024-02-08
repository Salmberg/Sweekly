//
//  WeeklyPlannerViewModel.swift
//  Sweekly
//
//  Created by David Salmberg on 2024-02-07.
//

import Foundation


class WeeklyPlannerViewModel: ObservableObject {
    @Published var week: Week = generateCurrentWeek()

    private static let dayNameFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE" // "EEE" ger kort namn på veckodagen
        return formatter
    }()

    private static func generateCurrentWeek() -> Week {
        let calendar = Calendar.current
        let today = Date()

        guard let monday = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today)),
              let nextMonday = calendar.date(byAdding: .weekOfYear, value: 1, to: monday) else {
            fatalError("Could not calculate the first day of the week.")
        }

        var daysInWeek: [Day] = []

        var currentDate = monday
        while currentDate < nextMonday {
            let dayModel = Day(name: Self.dayNameFormatter.string(from: currentDate), date: currentDate, tasks: [])
            daysInWeek.append(dayModel)

            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }

        return Week(days: daysInWeek)
    }
}
