//
//  FooterView.swift
//  swiftUIproject
//
//  Created by aslyy on 18.03.2021.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
            Text("Food you love, without the wait.")
                .foregroundColor(.gray)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .layoutPriority(2)
            Text("Order ahead from your favorite restaurants in your campus \nwith Buy & Run.")
                .foregroundColor(.gray)
                .font(.body)
                .multilineTextAlignment(.center)
                .layoutPriority(2)
            Image("iconlogo")
                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                .foregroundColor(.gray)
                .layoutPriority(/*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            Text("Copyright @ Bitirim\n All right reserved")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(1)
            
        })
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
}
