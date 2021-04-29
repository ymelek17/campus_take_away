//
//  ConfirmView.swift
//  swiftUIproject
//
//  Created by Yasemin Melek on 14.04.2021.
//

import SwiftUI

struct ConfirmView: View {
    
    @State private var confirmed = false
    @ObservedObject var requests = Requests()

    var body: some View {
        
        HStack {
          Spacer()
            Button(action: {
                confirmed = true
                requests.orderEvent(name: "MoonSand", customer: user)
                requests.getActiveOrders(name: "MoonSand")
            }, label:{
                Text("CONFIRM")
                    .foregroundColor(Color.white)
                    .font(.system(.callout, design: .serif))
                    .fontWeight(.bold)
                    .shadow(radius: 3)
                    .padding(.vertical)
                    .padding(.horizontal, 0)
                    .frame(width: 185)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color("purple"))
                            .shadow(color: Color("purple"), radius: 6, x: 0, y: 6)
                      )
                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                })
            .edgesIgnoringSafeArea(.all)
        }.sheet(isPresented: self.$confirmed) {
            RestaurantMenuView()
          }
    }
}

struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
