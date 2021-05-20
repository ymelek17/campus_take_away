//
//  AddItemView.swift
//
//  Created by aslyy on 10.04.2021.
//

import SwiftUI

struct AddItemView: View {
    
    @ObservedObject var requests = Requests()
    @State private var pulsate: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedObjectContext

    
    @State private var product_name: String = ""
    @State private var product_description: String = ""
    @State private var price: String = ""
    @State private var product_id: Int = 1245
    @State private var isEditing = false
    
    @State private var errorshowing: Bool = false
    @State private var errortitle: String = ""
    @State private var errormsg: String = ""

    
    var body: some View {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center, spacing: 0) {
            
            Text("")
            Text("")
            Text("")
            Text("")
            Text("")
            Text("")
          
          Group {
           
            Text("New Product")
              .fontWeight(.bold)
              .foregroundColor(Color("Blue"))
              .modifier(TitleModifier())
            
            //-----product name------
            TextField("Enter Product Name",text: $product_name)
            .frame(width: 300.0, height: 35.0)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            //.border(Color(UIColor.separator))
            .font(.headline)
            .padding()
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(9)

            Spacer()
            //----product description-----
            TextField(
                "Enter Product Description",
                 text: $product_description
            )
            .frame(width: 300.0, height: 35.0)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            //.border(Color(UIColor.separator))
            .font(.headline)
            .padding()
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(9)

            
            Spacer()
            //-----product price-----
            TextField(
                "Enter Product Price",
                 text: $price
            )
            .frame(width: 300.0, height: 35.0)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            //.border(Color(UIColor.separator))
            .font(.headline)
            .padding()
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(9)

            
                        
            Spacer()
           //READY
           Button(action: {
            // ACTION
            if self.product_name != "" {
                let core = BuyRun(context: self.managedObjectContext)
                core.product_name = self.product_name
                core.product_description = self.product_description
                core.price = self.price
                
                let randomInt = Int.random(in: 0..<100)
                let p = Product(product_id: String(randomInt), product_name: self.product_name, price: self.price, product_description: self.product_description)
                requests.menuAdd(name: cafe.company_name, product: p)
                requests.getMenu(cafe: cafe)
                    do{
                        try self.managedObjectContext.save()
                        print("new product added: \(core.product_name ?? ""), with price: \(core.price ?? "")")
                    }
                    catch {
                        
                        print(error)
                    }
            } else {
                self.errorshowing=true
                self.errortitle = "Invalid entry"
                self.errormsg = "Enter all values as requested."
                return
            }
            self.presentationMode.wrappedValue.dismiss()
            
           },
           label: {
              Text("SAVE")
                  .foregroundColor(Color.white)
                  .font(.system(.callout, design: .serif))
                  .fontWeight(.bold)
                  .shadow(radius: 3)
                  .padding(.vertical)
                  .padding(.horizontal, 0)
                  .frame(width: 185)
                  .background(
                      RoundedRectangle(cornerRadius: 12)
                          .fill(LinearGradient(gradient: Gradient(colors: [Color("LighterBlue"), Color("Blue")]), startPoint: .top, endPoint: .bottom))
                          .shadow(color: Color("ColorBlackTransparentLight"), radius: 6, x: 0, y: 6)
                    )
                  .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
              })
              //END SAVE BUTTON
            
          }
          .padding(.horizontal, 24)
          .padding(.vertical, 2)
        }
      }
      .edgesIgnoringSafeArea(.top)
      .overlay(
        HStack {
          Spacer()
          VStack {
            Button(action: {
              self.presentationMode.wrappedValue.dismiss()
            }, label: {
              Image(systemName: "xmark")
                .font(.title)
                .foregroundColor(Color("Blue"))
                .shadow(radius: 3)
                .opacity(self.pulsate ? 1 : 0.6)
                .scaleEffect(self.pulsate ? 1.2 : 0.8, anchor: .center)
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
            })
              .padding(.trailing, 20)
              .padding(.top, 24)
            .alert(isPresented: $errorshowing){
                Alert(title: Text(errortitle),
                      message: Text(errormsg),
                      dismissButton: .default(Text("OK")))
            }
            Spacer()
          }
        }
      )
      .onAppear() {
        self.pulsate.toggle()
      }
    }
  }

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
