//
//  swiftUIprojectApp.swift
//  swiftUIproject
//
//  Created by aslyy on 18.03.2021.
//

import SwiftUI

@main
struct swiftUIprojectApp: App {
    var body: some Scene {
        WindowGroup {
        
        TabView {
            ContentView()
                .environmentObject(Menu())
                .tabItem({
                    Image(systemName: "homekit")
                    Text("Home")
                    
                })
            CampaignView()
                .tabItem({
                    Image(systemName: "gift.fill")
                    Text("Campaigns")
              })
            
            SearchView()
                .tabItem({
                    Image(systemName: "magnifyingglass")
                    Text("Search")
              })
            
            BasketView(product: products[0])
                .tabItem({
                    Image(systemName: "cart")
                    Text("Basket")
              })
            SettingsView()
                .tabItem({
                    Image(systemName: "person.fill")
                    Text("My Account")
              })
        }
        .accentColor(Color.primary)
      }
    }
        
}
