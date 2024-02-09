//
//  DailyDetailViewModel.swift
//  Sweekly
//
//  Created by David Salmberg on 2024-02-07.
//

import Foundation


class DailyDetailViewModel: ObservableObject {
    @Published var selectedDay: Day?
    @Published var tasks: [Task] = []

    init(selectedDay: Day?) {
        self.selectedDay = selectedDay
    }

    func fetchTasks() {
        guard let selectedDay = selectedDay else { return }

    }
    
    func toggleTaskCompletion(_ task: Task) {
        if let index = tasks.firstIndex(of: task) {
            tasks[index].completed.toggle()
        }
    }

    // Formatter för att hämta dagens namn
    private let dayNameFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE" // "EEEE" ger fullständigt namn på veckodagen
        return formatter
    }()
}
