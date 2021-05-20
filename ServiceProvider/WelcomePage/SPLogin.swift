
//
//  SPLogin.swift
//  swiftUIproject
//
//  Created by aslyy on 15.04.2021.
//

import SwiftUI

struct SPLogin: View {
    
    @EnvironmentObject var orderData: OrderData
    @ObservedObject var requests = Requests()
    @State private var pulsate: Bool = false
    @State private var isShowingMainView: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedObjectContext

    @State private var email: String = ""
    @State private var password: String = ""

    @State private var errorshowing: Bool = false
    @State private var errortitle: String = ""
    @State private var errormsg: String = ""

    
    var body: some View {
        NavigationView {
        VStack(alignment: .center, spacing: 0) {
        
          
        Group {
            

            //-----email-----
            TextField("Enter Email", text: $email)
            .frame(width: 300.0, height: 15.0)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            //.border(Color(UIColor.separator))
            .font(.headline)
            .padding()
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(9)
                
            //-----password------
            SecureField("Enter Password", text: $password)
            .frame(width: 300.0, height: 15.0)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            //.border(Color(UIColor.separator))
            .font(.headline)
            .padding()
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(9)

            Text(" ")

            //READY
            VStack{
                NavigationLink(destination: AppView().navigationBarBackButtonHidden(true).navigationBarHidden(true).navigationBarTitle("", displayMode: .inline).environmentObject(OrderData()), isActive: $isShowingMainView){  }
           Button(action: {
            // ACTION
            if
                self.password == "" ||
                self.email == ""
            {
                    self.errorshowing=true
                    self.errortitle = "Invalid entry"
                    self.errormsg = "Enter all values as requested."
                    return

            } else {
                requests.authenticate(email: self.email, password: self.password)
                requests.myGroup.notify(queue: DispatchQueue.main, execute: {
                    print("Finished authentication.")
                    if requests.auth == 1{
                        requests.getActiveOrders(cafe: cafe)
                            for i in 0..<menuProducts.count {
                                let core = BuyRun(context: self.managedObjectContext)
                                core.product_name = menuProducts[i].product_name
                                core.product_description = menuProducts[i].product_description
                                core.price = menuProducts[i].price
                                do{
                                    try self.managedObjectContext.save()
                                    print("new product added: \(core.product_name ?? ""), with price: \(core.price ?? "")")
                                }
                                catch {
                                    print(error)
                                }
                            }
                        requests.myGroup.notify(queue: DispatchQueue.main, execute: {
                            print("PreviousList: \n", previousList)
                            print("PreviousOrderList: \n", orderData.previousOrderList)
                            print("Finished all requests.")
                            self.isShowingMainView = true
                        })
                    }
                    return
                })
            }
            
           },
           label: {
              Text("Login")
                  .foregroundColor(Color.white)
                  .font(.system(.callout, design: .serif))
                  .fontWeight(.bold)
                  .shadow(radius: 3)
                  .padding(.vertical)
                  .padding(.horizontal, 0)
                  .frame(width: 185)
                  .background(
                      RoundedRectangle(cornerRadius: 12)
                          .fill(LinearGradient(gradient: Gradient(colors: [Color("blue-1"), Color("blue-1")]), startPoint: .top, endPoint: .bottom))
                          .shadow(color: Color("blue-1"), radius: 6, x: 0, y: 6)
                    )
              })
            }
              //END SAVE BUTTON
            Spacer()
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

               })
               .padding(.trailing, 240)
                 .padding(.top, 20)
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

struct SPLogin_Previews: PreviewProvider {
    static var previews: some View {
        SPLogin()
    }
}
