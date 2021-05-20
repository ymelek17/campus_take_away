//
//  OrderLimit.swift
//  ServiceProvider14Ap
//
//  Created by aslyy on 29.04.2021.
//

import SwiftUI

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

struct OrderLimit: View {
    
    @ObservedObject var requests = Requests()
    @State var nameInEditMode = false
    @State var limit = cafe.timeslots[0]
    @State private var errorshowing: Bool = false
    @State private var errortitle: String = ""
    @State private var errormsg: String = ""
    
    var body: some View {

        HStack {

            if nameInEditMode {
                Text("Enter New Limit:")
                    .font(.title2)
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                TextField("Limit", text: $limit)
                    .frame(width: 100, height: 40)
                    .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5).font(.system(size: 20))
                    .autocapitalization(.words)
                    .disableAutocorrection(true)
            } else {
                Text("Maximum Order Amount: " + limit).font(.title2)
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
            }
            Spacer()

            Button(action: {
                if(limit.isInt){
                    self.nameInEditMode.toggle()
                    requests.timeSlot(cafe: cafe, limit: limit,opening: cafe.opening_hour, closing: cafe.closing_hour)
                } else {
                    self.errorshowing=true
                    self.errortitle = "Invalid Entry"
                    self.errormsg = "Please Enter A Valid Number!"
                    return
                }
                
            }) {
                if nameInEditMode {
                    Image(systemName: "lock.open.fill").resizable().frame(width: 30, height: 30).foregroundColor(Color("Blue"))
                } else {
                    Image(systemName: "lock.fill").resizable().frame(width: 26, height: 30).foregroundColor(Color("Blue"))
                }

            }
        }
        .padding(.horizontal, 30.0)
        .alert(isPresented: $errorshowing){
            Alert(title: Text(errortitle),
                  message: Text(errormsg),
                  dismissButton: .default(Text("OK")))

}
}
}


struct OrderLimit_Previews: PreviewProvider {
    static var previews: some View {
        OrderLimit()
    }
}



