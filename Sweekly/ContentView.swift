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
               // HomeScreen()
                MainTabBar(tabLabel: $tabLabel)
            }
        }
    }
}

#Preview {
    ContentView()
}
