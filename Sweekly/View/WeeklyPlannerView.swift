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
            LazyVGrid(columns: [GridItem(.flexible())], spacing: 35) {
                ForEach(viewModel.week.days) { day in
                    NavigationLink(destination: DailyDetailView(viewModel: DailyDetailViewModel(selectedDay: day), day: day)) {
                        VStack {
                            HStack {
                                Text(day.name)
                                    .foregroundColor(.black)
                                Text(day.formattedDate)
                                    .foregroundColor(dayIsWeekend(day) ? Color.red : Color.black)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .aspectRatio(1.0, contentMode: .fit)

                    }
                    Divider().background(Color.black)
                }
            }
            .navigationBarHidden(true)
            .padding(16)
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(.black)
    }

    private func dayIsWeekend(_ day: Day) -> Bool {
        return day.name == "Saturday" || day.name == "Sunday"
    }
}

struct WeeklyPlannerView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyPlannerView()
    }
}
