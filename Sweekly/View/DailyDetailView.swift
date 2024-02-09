//
//  DailyDetailView.swift
//  Sweekly
//
//  Created by David Salmberg on 2024-02-07.
//

import SwiftUI


struct DailyDetailView: View {
    @ObservedObject var viewModel: DailyDetailViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var isAddTaskViewPresented = false

    var body: some View {
        
        VStack {
                    ForEach(viewModel.tasks) { task in
                        Button(action: {
                            viewModel.toggleTaskCompletion(task)
                        }) {
                            HStack {
                                Image(systemName: task.completed ? "checkmark.square" : "square")
                                    .foregroundColor(.black)
                                    .imageScale(.large)
                                Text(task.title)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }

        
        .navigationTitle(viewModel.selectedDay?.name ?? "")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.black)
                    .imageScale(.large)
            },
            trailing: Button(action: {
                isAddTaskViewPresented.toggle()
            }) {
                Image(systemName: "plus.circle")
                    .foregroundColor(.black)
                    .imageScale(.large)
            }
        )
        .onAppear {
            // Hämta uppgifter när vyn visas
            viewModel.fetchTasks()
        }
        .sheet(isPresented: $isAddTaskViewPresented) {
            AddTaskView(viewModel: AddTaskViewModel(onAddTask: { newTask in
                viewModel.tasks.append(newTask)
                isAddTaskViewPresented.toggle()
            }))
        }
    }
}
