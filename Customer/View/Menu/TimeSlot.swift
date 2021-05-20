//
//  TimeSlot.swift
//  swiftUIproject
//
//  Created by Yasemin Melek on 13.04.2021.
//

import SwiftUI


var selected_timeslot = ""
var selected_index = 0

struct TimeSlot: View {


    @EnvironmentObject var basketInfo: BasketInfo
    @State private var selectedTimeSlot = 0
    @State var cafe_model: CafeModel

      var body: some View {
        VStack(spacing: -5.0) {
            Text("Selected time slot: \((basketInfo.timeslots_cafes[cafe_model.company_name]![selectedTimeSlot]))")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                .frame(width: 330, height: 34, alignment: .center)
                .background(colorGray.cornerRadius(10).opacity(1.0))
                .foregroundColor(.black)
                
                    
            Picker(selection: $selectedTimeSlot, label: Text("Selected Time Slot"), content: {
                ForEach(0..<basketInfo.timeslots_cafes[cafe_model.company_name]!.count) { index in
                    Text(basketInfo.timeslots_cafes[cafe_model.company_name]![index])
                }
            }).onReceive([basketInfo.timeslots_cafes[cafe_model.company_name]![selectedTimeSlot]].publisher.first()) {  value in
                selected_timeslot = value
               // selected_index = basketInfo.timeslots_cafes[cafe_model.company_name]!.firstIndex(where: {$0 == value}) ?? 0
                print(selected_timeslot + " " + String(selected_index))
            }
            .frame(height: 90.0)
            
         }
      }
}

struct TimeSlot_Previews: PreviewProvider {
    static var previews: some View {
        TimeSlot(cafe_model: cafe)//, timeMap: ["" : 0], timeList: [""])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
