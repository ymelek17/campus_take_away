//
//  Reorder.swift
//  swiftUIproject
//
//  Created by aslyy on 3.05.2021.
//

import SwiftUI

struct Reorder: View {
    

    var body: some View {
        
        HStack {
          Spacer()
            Button(action: {
                //AYNI ORDERI BASKETA EKLEYECEK
 
            }, label:{
                Text("Reorder")
                    .foregroundColor(Color.white)
                    .font(.system(.callout, design: .serif))
                    .fontWeight(.medium)
                    .shadow(radius: 3)
                    .padding(.vertical)
                    .padding(.horizontal, 0)
                    .frame(width: 100, height: 30)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color("purple"))
                            .shadow(color: Color("purple"), radius: 6, x: 0, y: 4)
                      )
                })
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct Reorder_Previews: PreviewProvider {
    static var previews: some View {
        Reorder()
    }
}
