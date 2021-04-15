

import SwiftUI

struct ContentView: View {

  
  var orderInfos: [OrderInfo] = OrderInfoData
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 20) {

        
        Text("")
          .fontWeight(.bold)
          .modifier(TitleModifier())
        
        Text("Current Orders")
          .fontWeight(.bold)
          .modifier(TitleModifier())
        
        VStack(alignment: .center, spacing: 20) {
          ForEach(orderInfos) { item in
            OrderScrollView(orderinfo: item)
          }
        }
        .frame(maxWidth: 640)
        .padding(.horizontal)
        
    
      }
    }
    .edgesIgnoringSafeArea(.all)
    .padding(0)
  }
}

struct TitleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(.title, design: .serif))
      .foregroundColor(Color("Blue"))
      .padding(8)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(orderInfos: OrderInfoData)
      .previewDevice("iPhone 12 Pro")
  }
}
