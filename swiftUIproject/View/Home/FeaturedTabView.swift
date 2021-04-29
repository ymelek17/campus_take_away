
//  swiftUIproject
//
//  Created by aslyy on 18.03.2021.
//
import SwiftUI

struct FeaturedTabView: View {
  var body: some View {
    TabView {
      ForEach(sliders) { slider in
        FeaturedItemView(slider: slider)
          .padding(.top, 10)
          .padding(.horizontal, 15)
      }
    } 
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
  }
}

struct FeaturedTabView_Previews: PreviewProvider {
  static var previews: some View {
    FeaturedTabView()
      .previewDevice("iPhone 12 Pro")
      .background(Color.gray)
  }
}
