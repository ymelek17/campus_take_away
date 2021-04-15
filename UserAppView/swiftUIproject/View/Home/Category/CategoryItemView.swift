
//  swiftUIproject
//
//  Created by aslyy on 18.03.2021.
//

import SwiftUI

struct CategoryItemView: View {
  
  let category: Category
  

  
  var body: some View {
    Button(action: {}, label: {
      HStack(alignment: .center, spacing: 6) {
        Image(category.image)
          .renderingMode(.template)
          .resizable()
          .scaledToFit()
          .frame(width: 30, height: 30, alignment: .center)
          .foregroundColor(.gray)
        
        Text(category.name.uppercased())
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 1.0))
        
        Spacer()
      }
      .padding()
      .background(Color.white.cornerRadius(15))
      .background(
        RoundedRectangle(cornerRadius: 15)
          .stroke(Color.gray, lineWidth: 5)
      )
    })
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
