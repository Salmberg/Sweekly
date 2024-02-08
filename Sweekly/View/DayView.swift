//
//  DayView.swift
//  Sweekly
//
//  Created by David Salmberg on 2024-02-07.
//

import SwiftUI

struct DayView: View {
    var day: Day

    var body: some View {
        VStack {
            Text(day.name)
            // Visa andra daginformation om det behövs
        }
    }
}

