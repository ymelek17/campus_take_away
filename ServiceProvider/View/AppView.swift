

import SwiftUI

struct AppView: View {
  @EnvironmentObject var orderData: OrderData
  @State private var index = 0
    
  var body: some View {
    TabView (selection: self.$index){
        MenuEditView()
            .tabItem{
            Image(systemName: "bookmark.fill")
            Text("Menu")
        }
        .tag(0)
        ContentView(orders: orderData.savedList)
        .tabItem{
            Image(systemName: "ellipses.bubble.fill")
          Text("Orders")
        }
        .tag(1)
      AllOrderRequestsView()
        .tabItem{
            Image(systemName: "bell.fill")
          Text("Requests")
        }
        .tag(2)
      SettingsView()
        .tabItem{
            Image(systemName: "slider.horizontal.3")
          Text("Settings")
        }
        .tag(3)
    }
    .accentColor(Color.primary)
  }
}

struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView()
        .previewLayout(.device)
  }
}
