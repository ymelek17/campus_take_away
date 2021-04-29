//
//  UserMainNavigator.swift
//  swiftUIproject
//
//  Created by aslyy on 15.04.2021.
//

import SwiftUI

struct UserMainNavigator: View {
    var body: some View {
 
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
            
            BasketView() 
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

struct UserMainNavigator_Previews: PreviewProvider {
    static var previews: some View {
        UserMainNavigator()
    }
}
