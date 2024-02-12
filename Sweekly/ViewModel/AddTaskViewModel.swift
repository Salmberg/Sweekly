//
//  AddTaskViewModel.swift
//  Sweekly
//
//  Created by David Salmberg on 2024-02-08.
//

import Foundation

class AddTaskViewModel: ObservableObject {
    @Published var taskTitle: String = ""
    @Published var taskDescription: String = ""
    @Published var selectedHour: Int = 0
    @Published var selectedMinute: Int = 0
    @Published var tasks: [Task] = []
    
    var onAddTask: ((Task) -> Void)

    init(onAddTask: @escaping (Task) -> Void) {
        self.onAddTask = onAddTask
    }

    func addTask() {
        guard !taskTitle.isEmpty else {
            return
        }

        let newTask = Task(title: taskTitle, description: taskDescription, hour: selectedHour, minute: selectedMinute)
        tasks.append(newTask)

        onAddTask(newTask)

        taskTitle = ""
        taskDescription = ""
        selectedHour = 0
        selectedMinute = 0
    }
}






