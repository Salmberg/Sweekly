//
//  AddTaskView.swift
//  Sweekly
//
//  Created by David Salmberg on 2024-02-08.
//

import SwiftUI

struct AddTaskView: View {
    @ObservedObject var viewModel: AddTaskViewModel
    @Environment(\.presentationMode) var presentationMode


    var body: some View {
        VStack {
            TextField("Enter task title", text: $viewModel.taskTitle)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            HStack {
                Picker("Hours", selection: $viewModel.selectedHour) {
                    ForEach(0..<24, id: \.self) { hour in
                        Text("\(hour)")
                    }
                }
                .frame(width: 80)

                Picker("Minutes", selection: $viewModel.selectedMinute) {
                    ForEach(0..<60, id: \.self) { minute in
                        Text("\(minute)")
                    }
                }
                .frame(width: 80)
            }

            Button("Add Task") {
                viewModel.addTask()
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(8)

            List(viewModel.tasks, id: \.self) { task in
                VStack(alignment: .leading) {
                    Text("Title: \(task.title)")
                    Text("Time: \(task.timeString)")
                }
            }
        }
        .padding()
        .navigationTitle("Add Task")
    }
}


