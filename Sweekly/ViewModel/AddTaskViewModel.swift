//
//  AddTaskViewModel.swift
//  Sweekly
//
//  Created by David Salmberg on 2024-02-08.
//

import Foundation

class AddTaskViewModel: ObservableObject {
    @Published var taskTitle: String = ""

    func addTask() {
        // Här kan du använda taskTitle för att lägga till uppgiften i din modell eller var du sparar dina uppgifter
        print("Adding task: \(taskTitle)")
        // Lägg till ditt logik för att spara uppgiften här
    }
}
