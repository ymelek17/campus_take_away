//
//  ConfirmView.swift
//  swiftUIproject
//
//  Created by Yasemin Melek on 14.04.2021.
//

import SwiftUI

struct ConfirmView: View {
    
    @ObservedObject var requests = Requests()
    @EnvironmentObject var basketInfo: BasketInfo

    var body: some View { 
        
        HStack {
          Spacer()
            Button(action: {
                isOrderReceived = true
                basketInfo.basket_confirmed = true
                for (key,value) in timeslotMap {
                    if(value == selected_timeslot){
                        selected_index = key
                    }
                }
                requests.orderEvent(name: current_brand, customer: user, time: String(selected_index + 1))
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
                })
            .edgesIgnoringSafeArea(.all)
        }//.sheet(isPresented: self.$confirmed) {
         // }
    }
}

struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
