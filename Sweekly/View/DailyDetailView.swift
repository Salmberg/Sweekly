//
//  DailyDetailView.swift
//  Sweekly
//
//  Created by David Salmberg on 2024-02-07.
//

import SwiftUI


import SwiftUI

struct DailyDetailView: View {
    @ObservedObject var viewModel: DailyDetailViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var isAddTaskViewPresented = false
    @State private var currentHour: Int = Calendar.current.component(.hour, from: Date())
    @State private var scrollToHour: Int? = nil
    var day: Day

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ScrollViewReader { scrollView in
                        ForEach(0..<24, id: \.self) { hour in
                            Section(header: Text("\(hour):00").font(.headline)) {
                                let tasksForHour = viewModel.tasks.filter { $0.hour == hour }
                                
                                if tasksForHour.isEmpty {
                                    Text("Inga uppgifter för detta klockslag")
                                        .foregroundColor(.secondary)
                                        .italic()
                                } else {
                                    ForEach(tasksForHour) { task in
                                        Text(task.title)
                                    }
                                }
                            }
                            .id(hour)
                            if hour != 23 {
                                Divider()
                            }
                        }
                        .onAppear {
                            scrollToHour = currentHour
                            print("Nuvarande klockslag: \(currentHour)")
                            withAnimation {
                                scrollView.scrollTo(scrollToHour!, anchor: .top)
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .padding()
                .navigationBarTitle(day.name, displayMode: .inline)
                
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
                viewModel.fetchTasks()
                // Starta en Timer som uppdaterar currentHour varje minut
                Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
                    currentHour = Calendar.current.component(.hour, from: Date())
                }
            }
            .sheet(isPresented: $isAddTaskViewPresented) {
                AddTaskView(viewModel: AddTaskViewModel(onAddTask: { newTask in
                    viewModel.tasks.append(newTask)
                }), dailyDetailViewModel: viewModel)
            }
        }
    }
}







