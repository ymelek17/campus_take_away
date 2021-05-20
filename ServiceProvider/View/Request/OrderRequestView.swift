

import SwiftUI

struct OrderRequestView: View {
  
  @State var order: Order
  @EnvironmentObject var orderData: OrderData
  @State private var slideInAnimation: Bool = false
  
  var body: some View { 
    VStack {
        VStack(alignment: .center, spacing: 0) {
          
          Text("ORDER")
            .font(.system(.body, design: .serif))
            .fontWeight(.heavy)
            
         Text("#" + order.orderNo)
            .font(.system(.largeTitle, design: .serif))
            .fontWeight(.bold)
        }.font(.system(.largeTitle, design: .serif))
        .foregroundColor(Color("DarkBlue"))
        .frame(width: 100, height: 100, alignment: .center)
            .clipShape(Circle())
            .background(
                Circle()
                    .fill(Color("LighterBlue"))
                    .frame(width: 110, height: 110, alignment: .center))
            .background(
                Circle()
                    .fill(Color("ColorAppearanceAdaptive"))
                    .frame(width: 120, height: 120, alignment: .center)
        )
        .zIndex(1)
        .animation(Animation.easeInOut(duration: 1))
        .offset(y: slideInAnimation ? 55 : -55)
      
      VStack(alignment: .center, spacing: 10) {
        // ORDER NO
        VStack(alignment: .center, spacing: 0) {}
        .padding(.top, 65)
        .frame(width: 180)
        
        // CUSTOMER INFO
        Text("Customer:\n" + order.customer.username)
            .font(.system(.footnote, design: .serif))
          .foregroundColor(Color("DarkBlue"))
          .padding(.vertical, 12)
          .padding(.horizontal, 0)
          .frame(width: 220)
          .background(
            RoundedRectangle(cornerRadius: 10)
              .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color("LighterBlue")]), startPoint: .top, endPoint: .bottom))
            .shadow(color: Color("ColorBlackTransparentLight"), radius: 6, x: 0, y: 6)
          )
        
        // ORDER DESCRIPTION
        Spacer()
        ForEach(order.description, id: \.self) { item in
            Text(item)
                .font(.title3)
                .foregroundColor(Color("DarkBlue"))
                .fontWeight(.bold)
                .lineLimit(nil)
            Divider()
        }
        Spacer()
        
        // REQUEST
        Button(action: {
          // ACTION
            orderData.savedList.append(order)
            orderList.remove(at: orderList.firstIndex(where: {$0.customer.username == order.customer.username})!)
        }, label: {
            Text("ACCEPT")
                .foregroundColor(Color.white)
                .font(.system(.callout, design: .serif))
                .fontWeight(.bold)
                .shadow(radius: 3)
                .padding(.vertical)
                .padding(.horizontal, 0)
                .frame(width: 185)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("Blue"), Color("DarkBlue")]), startPoint: .top, endPoint: .bottom))
                        .shadow(color: Color("ColorBlackTransparentLight"), radius: 6, x: 0, y: 6)
              )
            //.animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
        })
        
        

        Spacer()
      }
      .zIndex(0)
      .multilineTextAlignment(.center)
      .padding(.horizontal)
      .frame(width: 260, height: 485, alignment: .center)
      .background(LinearGradient(gradient: Gradient(colors: [Color("LighterBlue"), Color("Blue")]), startPoint: .top, endPoint: .bottom))
      .cornerRadius(20)
    }
    .edgesIgnoringSafeArea(.all)
    .onAppear(perform: {
      slideInAnimation = true
    })
  }
}

struct OrderRequestView_Previews: PreviewProvider {
  static var previews: some View {
    OrderRequestView(order: orderList[0])
      .previewDevice("iPhone 12 Pro")
  }
}
