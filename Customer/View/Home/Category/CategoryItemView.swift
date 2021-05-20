
//  swiftUIproject
//
//  Created by aslyy on 18.03.2021.
//

import SwiftUI

struct CategoryItemView: View {
  
  let category: Category
  

  
  var body: some View {
    Button(action: {}, label: {
      HStack(alignment: .center, spacing: 1) {
        
        Text(category.name.uppercased())
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1.0))
            .multilineTextAlignment(.center)
        
        Spacer()
      }
      .padding()
      .background(Color.white.cornerRadius(15))
      .background(
        RoundedRectangle(cornerRadius: 15)
          .stroke(Color.gray, lineWidth: 7)
      )
    }).frame(width: 150)
    
  }
}



struct CategoryItemView_Previews: PreviewProvider {
  static var previews: some View {
    CategoryItemView(category: categories[0])
      .previewLayout(.sizeThatFits)
      .padding()
      .background(colorBackground)
  }
}
