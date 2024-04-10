//
//  ContentView.swift
//  Sweekly
//
//  Created by David Salmberg on 2024-02-07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text(MainTabBar().tabLabel)
               // HomeScreen()
                MainTabBar()
            }
        }
    }
}

#Preview {
    ContentView()
}
