//
//  UserMainNavigator.swift
//  swiftUIproject
//
//  Created by aslyy on 15.04.2021.
//

import SwiftUI

struct UserMainNavigator: View {
    @EnvironmentObject var basketInfo: BasketInfo
    @State var index = 0

    var body: some View {
        TabView (selection: $index){
            ContentView()
                .tabItem{
                    Image(systemName: "homekit")
                    Text("Home")
                }.tag(0)
                .environmentObject(Menu())
            CampaignView()
                .tabItem{
                    Image(systemName: "gift.fill")
                    Text("Campaigns")
                }.tag(1)
            
            SearchView()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }.tag(2)
            
            BasketView(productsBasket: basketInfo.basketProducts, time_slot: basketInfo.time_slot)
                .tabItem{
                    Image(systemName: "cart")
                    Text("Basket")
                }.tag(3)
            SettingsView()
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("My Account")
                }.tag(4)
        }
        .accentColor(Color.primary)
    }
}

struct UserMainNavigator_Previews: PreviewProvider {
    static var previews: some View {
        UserMainNavigator()
    }
}
