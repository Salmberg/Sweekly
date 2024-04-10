//
//  MainTabBar.swift
//  Sweekly
//
//  Created by David Salmberg on 2024-04-10.
//


import SwiftUI

struct MainTabBar: View {
    
    let tabLabel = "Sweekly"
    
    var body: some View {
        TabView {
            Text("Hemskärmen")
                .tabItem {
                    Label("Hem", systemImage: "house")
                }
            WeeklyPlannerView()
                .tabItem {
                    Label("Veckoplanering", systemImage: "calendar")
                }
            Text("Flik 3")
                .tabItem {
                    Label("Flik 3", systemImage: "3.circle")
                }
            Text("Flik 4")
                .tabItem {
                    Label("Konto", systemImage: "person")
                }
        }
    }
}
