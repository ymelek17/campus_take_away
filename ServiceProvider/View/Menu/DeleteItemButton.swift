//
//  DeleteItemButton.swift
//
//  Created by aslyy on 10.04.2021.
//

import SwiftUI

struct DeleteItemButton: View {
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    @State private var showModel: Bool = false
    
    var body: some View {
      VStack(alignment: .leading, spacing: 2) {
        Image(systemName: "pencil.circle.fill")
          .resizable()
          .scaledToFit()
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .background(Circle().fill(Color("ColorBase")))
          .frame(width: 30, height: 30, alignment: .center)
      }
      .background(Color.white)
      .cornerRadius(12)
      .onTapGesture {
        self.hapticImpact.impactOccurred()
        self.showModel = true
      }
      .sheet(isPresented: self.$showModel) {
        DeleteItemView()
      }
    }
  }
struct DeleteItemButton_Previews: PreviewProvider {
    static var previews: some View {
        DeleteItemButton()
            .previewLayout(.sizeThatFits)

    }
}
