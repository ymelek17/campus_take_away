//
//  swiftUIproject
//
//  Created by aslyy on 18.03.2021.
//
import SwiftUI

struct FeaturedItemView: View {

  
  let slider: Slider
  

  
  var body: some View {
    Image(slider.image)
      .resizable()
      .scaledToFit()
      .cornerRadius(12)
  }
}



struct FeaturedItemView_Previews: PreviewProvider {
  static var previews: some View {
    FeaturedItemView(slider: sliders[0])
      .previewLayout(.sizeThatFits)
      .padding()
      .background(colorBackground)
  }
}
