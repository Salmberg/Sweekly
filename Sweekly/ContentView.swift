//
//  ContentView.swift
//  Sweekly
//
//  Created by David Salmberg on 2024-02-07.
//

import SwiftUI

struct ContentView: View {
    @State private var tabLabel = "Sweekly"
    var body: some View {
        NavigationView {
            VStack {
                Text(tabLabel)
                MainTabBar(tabLabel: $tabLabel)
            }
            .background(darkBlueAccentColor)
        }
    }
}

#Preview {
    ContentView()
}
