

import SwiftUI

struct AppView: View {
  var body: some View {
    TabView {
        MenuEditView()
            .tabItem({
            Image(systemName: "bookmark.fill")
            Text("Menu")
        })
      ContentView()
        .tabItem({
            Image(systemName: "ellipses.bubble.fill")
          Text("Orders")
        })
      AllOrderRequestsView()
        .tabItem({
            Image(systemName: "bell.fill")
          Text("Requests")
        })
      SettingsView()
        .tabItem({
            Image(systemName: "slider.horizontal.3")
          Text("Settings")
        })
    }
    .accentColor(Color.primary)
  }
}

struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView()
      .previewDevice("iPhone 12 Pro")
  }
}
