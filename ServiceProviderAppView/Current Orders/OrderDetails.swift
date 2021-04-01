

import SwiftUI

struct OrderDetails: View {
  
  var orderinfo: OrderInfo
  
  @State private var pulsate: Bool = false
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 0) {
  
        Image("company_image")
          .resizable()
          .scaledToFit()
        
        Group {
          
            OrderPopView(orderinfo: orderinfo)
          

          Text("Order Detail")
            .fontWeight(.bold)
            .foregroundColor(Color("Blue"))
            .modifier(TitleModifier())
          
          VStack(alignment: .leading, spacing: 5) {
            ForEach(orderinfo.orderContext, id: \.self) { item in
              VStack(alignment: .leading, spacing: 5) {
                Text(item)
                  .font(.footnote)
                  .multilineTextAlignment(.leading)
                Divider()
              }
            }
          }
            
         //READY
         Button(action: { // ACTION
         }, label: {
            Text("READY")
                .foregroundColor(Color.white)
                .font(.system(.callout, design: .serif))
                .fontWeight(.bold)
                .shadow(radius: 3)
                .padding(.vertical)
                .padding(.horizontal, 0)
                .frame(width: 185)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("LighterBlue"), Color("Blue")]), startPoint: .top, endPoint: .bottom))
                        .shadow(color: Color("ColorBlackTransparentLight"), radius: 6, x: 0, y: 6)
                  )
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
            })
            //END READY BUTTON
          
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
      }
    }
    .edgesIgnoringSafeArea(.top)
    .overlay(
      HStack {
        Spacer()
        VStack {
          Button(action: {

            self.presentationMode.wrappedValue.dismiss()
          }, label: {
            Image(systemName: "chevron.down.circle.fill")
              .font(.title)
              .foregroundColor(Color.white)
              .shadow(radius: 4)
              .opacity(self.pulsate ? 1 : 0.6)
              .scaleEffect(self.pulsate ? 1.2 : 0.8, anchor: .center)
              .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
          })
            .padding(.trailing, 20)
            .padding(.top, 24)
          Spacer()
        }
      }
    )
    .onAppear() {
      self.pulsate.toggle()
    }
  }
}

struct OrderDetails_Previews: PreviewProvider {
  static var previews: some View {
    OrderDetails(orderinfo: OrderInfoData[0])
  }
}
