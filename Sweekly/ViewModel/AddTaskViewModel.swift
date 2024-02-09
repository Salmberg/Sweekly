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
    @Published var tasks: [Task] = []
    
    var onAddTask: ((Task) -> Void)

    init(onAddTask: @escaping (Task) -> Void) {
        self.onAddTask = onAddTask
    }

    func addTask() {
        guard !taskTitle.isEmpty else {
            return
        }

        let newTask = Task(title: taskTitle, description: taskDescription)
        tasks.append(newTask)

        onAddTask(newTask)

        taskTitle = ""
        taskDescription = ""
    }
}


