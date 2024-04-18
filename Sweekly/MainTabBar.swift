//
//  MainTabBar.swift
//  Sweekly
//
//  Created by David Salmberg on 2024-04-10.
//


import SwiftUI

struct MainTabBar: View {
    @State private var selectedTab = 0
    @Binding var tabLabel: String
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeScreenView()              
                .tabItem {
                    Label("Hem", systemImage: "house")
                }
                .tag(0)
            
            WeeklyPlannerView()
                .tabItem {
                    Label("Veckoplanering", systemImage: "calendar")
                }
                .tag(1)
            
            GoalsView()
                .tabItem {
                    Label("Mål", systemImage: "checkmark.circle")
                }
                .tag(2)
            
            AccountView()
                .tabItem {
                    Label("Konto", systemImage: "person")
                }
                .tag(3)
        }
        .onChange(of: selectedTab) { newValue in
            switch newValue {
            case 0:
                tabLabel = "Hem"
            case 1:
                tabLabel = "Veckoplanering"
            case 2:
                tabLabel = "Mål"
            case 3:
                tabLabel = "Konto"
            default:
                break
            }
        }
    }
}


#Preview {
    MainTabBar(tabLabel: .constant("Hem"))
}


