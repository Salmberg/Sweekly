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
    var day: Day

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ScrollViewReader { scrollView in
                        ForEach(0..<24) { hour in
                            Section(header: Text("\(hour):00").font(.headline)) {
                                let tasksForHour = viewModel.tasks.filter { $0.hour == hour }
                                ForEach(tasksForHour) { task in
                                    Text(task.title)
                                }
                            }
                        }
                        .onChange(of: viewModel.tasks) { _ in
                            scrollView.scrollTo(17, anchor: .bottom)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .padding()
                .navigationBarTitle(day.name, displayMode: .inline)
                
                // Navigationsknappar här
                .navigationBarItems(
                    trailing: Button(action: {
                        isAddTaskViewPresented.toggle()
                    }) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.black)
                            .imageScale(.large)
                    }
                )
            }
            
            .onAppear {
                // Hämta uppgifter när vyn visas
                viewModel.fetchTasks()
            }
            .sheet(isPresented: $isAddTaskViewPresented) {
                AddTaskView(viewModel: AddTaskViewModel(onAddTask: { newTask in
                    viewModel.tasks.append(newTask)
                }))
            }
        }
    }
}




