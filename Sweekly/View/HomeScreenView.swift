//
//  HomeScreenView.swift
//  Sweekly
//
//  Created by David Salmberg on 2024-04-16.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        Text("Hemskärmen")
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(lightGrayColor)
    }
}

#Preview {
    HomeScreenView()
}
