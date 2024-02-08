//
//  WeeklyPlannerView.swift
//  Sweekly
//
//  Created by David Salmberg on 2024-02-07.
//


import SwiftUI

struct WeeklyPlannerView: View {
    @ObservedObject var viewModel = WeeklyPlannerViewModel()
    
    var body: some View {
        NavigationView {
            LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
                ForEach(viewModel.week.days) { day in
                    NavigationLink(destination: DailyDetailView(viewModel: DailyDetailViewModel(selectedDay: day))) {
                        VStack {
                            Text(day.name)
                                .foregroundColor(Color.black)
                            Text(day.formattedDate)
                                .foregroundColor(Color.red)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .aspectRatio(1.0, contentMode: .fit)
                        .overlay(
                            Rectangle()
                                .fill(Color.black)
                                .frame(height: 2)
                                .alignmentGuide(.leading, computeValue: { dimension in
                                    dimension[.leading]
                                })
                        )
                        
                    }
                }
            }
            .padding(16)
            .navigationTitle("Your Week")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct WeeklyPlannerView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyPlannerView()
    }
}
