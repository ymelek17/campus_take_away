//
//  DeleteItemView.swift
//
//  Created by aslyy on 10.04.2021.
//

import SwiftUI

struct DeleteItemView: View {
    @State private var pulsate: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    @State private var product_name: String = ""
    @State private var product_description: String = ""
    @State private var price: String = ""
    @State private var isEditing = false
    
    
    var body: some View {
        
        
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center, spacing: 0) {
            
            Text("Edit Product")
              .fontWeight(.bold)
              .foregroundColor(Color("Blue"))
              .modifier(TitleModifier())
            
        Group {
            

                
            //-----product name------
            TextField(
                "Enter New Product Name",
                 text: $product_name
            ) { isEditing in
                self.isEditing = isEditing
            }
            .frame(width: 300.0, height: 30.0)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            //.border(Color(UIColor.separator))
            .font(.headline)
            .padding()
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(9)
            Text(product_name)
                .foregroundColor(isEditing ? .red : .blue)
                .font(.headline)
            
            //----product description-----
            TextField(
                "Enter New Product Description",
                 text: $product_description
            ) { isEditing in
                self.isEditing = isEditing
            }
            .frame(width: 300.0, height: 30.0)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            //.border(Color(UIColor.separator))
            .font(.headline)
            .padding()
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(9)
            Text(product_description)
                .foregroundColor(isEditing ? .red : .blue)
                .font(.headline)
            
            
            //-----product price-----
            TextField(
                "Enter New Product Price",
                 text: $price
            ) { isEditing in
                self.isEditing = isEditing
            }
            .frame(width: 300.0, height: 30.0)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            //.border(Color(UIColor.separator))
            .font(.headline)
            .padding()
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(9)
            Text(price)
                .foregroundColor(isEditing ? .red : .blue)
                .font(.headline)
            
            
          }
          .padding(.horizontal, 24)
          .padding(.vertical, 2)
        
        Group {
//            //DELETE BUTTON
//            Button(action: { // ACTION
//            }, label: {
//               Text("Delete Product")
//                   .foregroundColor(Color.white)
//                   .font(.system(.callout, design: .serif))
//                   .fontWeight(.bold)
//                   .shadow(radius: 3)
//                   .padding(.vertical)
//                   .padding(.horizontal, 0)
//                   .frame(width: 280)
//                   .background(
//                       RoundedRectangle(cornerRadius: 12)
//                        .fill(LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 0.9, green: 0.2, blue: 0.2), Color(.sRGB, red: 0.7, green: 0.2, blue: 0.2)]), startPoint: .top, endPoint: .bottom))
//                           .shadow(color: Color("ColorBlackTransparentLight"), radius: 6, x: 0, y: 9)
//                     )
//                   .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
//               })
            
            Spacer()


           //SAVE BUTTON
           Button(action: { // ACTION
           }, label: {
              Text("UPDATE")
                  .foregroundColor(Color.white)
                  .font(.system(.callout, design: .serif))
                  .fontWeight(.bold)
                  .shadow(radius: 2)
                  .padding(.vertical)
                  .padding(.horizontal, 0)
                  .frame(width: 185)
                  .background(
                      RoundedRectangle(cornerRadius: 30)
                          .fill(LinearGradient(gradient: Gradient(colors: [Color("SaveButtonBlue"), Color("Blue")]), startPoint: .top, endPoint: .bottom))
                          .shadow(color: Color("ColorBlackTransparentLight"), radius: 3, x: 0, y: 1)
                    )
                  .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
              })
              //END SAVE BUTTON
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 2)
            
        }
        .padding(.top, 120.0)
      }
      .edgesIgnoringSafeArea(.top)
      .overlay(
        HStack {
          Spacer()
          VStack {
            Button(action: {

              self.presentationMode.wrappedValue.dismiss()
            }, label: {
              Image(systemName: "chevron.down.circle.fill")
                .font(.title)
                .foregroundColor(Color.white)
                .shadow(radius: 2)
                .opacity(self.pulsate ? 1 : 0.6)
                .scaleEffect(self.pulsate ? 1.2 : 0.8, anchor: .center)
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
            })
              .padding(.trailing, 20)
              .padding(.top, 24)
            Spacer()
          }
        }
      )
      .onAppear() {
        self.pulsate.toggle()
      }
    }
  }
    

    

struct DeleteItemView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteItemView()
    }
}


