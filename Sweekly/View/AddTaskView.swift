//
//  AddTaskView.swift
//  Sweekly
//
//  Created by David Salmberg on 2024-02-08.
//

import SwiftUI

struct AddTaskView: View {
    @ObservedObject var viewModel: AddTaskViewModel

    var body: some View {
        VStack {
            TextField("Enter task title", text: $viewModel.taskTitle)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Add Task") {
                viewModel.addTask()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
        }
        .padding()
        .navigationTitle("Add Task")
    }
}

