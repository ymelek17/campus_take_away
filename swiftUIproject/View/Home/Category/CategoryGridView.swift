
//  swiftUIproject
//
//  Created by aslyy on 18.03.2021.
//

import SwiftUI

struct CategoryGridView: View {

  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false, content: {
      LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
          ForEach(categories) { category in
            CategoryItemView(category: category)
          }
        })
      .frame(height: 130)
      .padding(.horizontal, 15)
      .padding(.vertical, 10)
    })
  }
}



struct CategoryGridView_Previews: PreviewProvider {
  static var previews: some View {
    CategoryGridView()
      .previewLayout(.sizeThatFits)
      .padding()
      .background(colorBackground)
  }
}
