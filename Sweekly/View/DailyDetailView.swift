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
            Text("Tasks for \(viewModel.selectedDay?.name ?? "")")
            
            // Visa uppgifter för den valda dagen
            ForEach(viewModel.tasks) { task in
                Text(task.title)
            }
        }
        .navigationTitle(viewModel.selectedDay?.name ?? "")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {
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
            AddTaskView(viewModel: AddTaskViewModel())
        }
    }
}

