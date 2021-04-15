//
//  TimeSlot.swift
//  swiftUIproject
//
//  Created by Yasemin Melek on 13.04.2021.
//

import SwiftUI


struct TimeSlot: View {
    
    @State private var selectedTimeSlot = 0
    var timeslots = ["8.00-8.30", "8.30-9.00", "9.00-9.30", "9.30-10.00", "10.00-10.30", "10.30-11.00", "11.00-11.30", "11.30-12.00", "12.00-12.30", "12.30-13.00", "13.00-13.30","13.30-14.00", "14.00-14.30", "14.30-15.00", "15.00-15.30", "15.30-16.00", "16.00-16.30", "16.30-17.00","17.00-17.30"]

      var body: some View {
        VStack(spacing: -5.0) {
            Text("Selected time slot: \(timeslots[selectedTimeSlot])")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                .frame(width: 330, height: 34, alignment: .center)
                .background(colorGray.cornerRadius(10).opacity(1.0))
                .foregroundColor(.black)
                
                    
            Picker(selection: $selectedTimeSlot, label: Text("Selected Time Slot"), content: {
                    ForEach(0 ..< timeslots.count) { index in
                        Text(self.timeslots[index])
                    }
            })
            .frame(height: 90.0)
            
            
         }//.navigationBarTitle("Selected Time Slot")
      }
}

struct TimeSlot_Previews: PreviewProvider {
    static var previews: some View {
        TimeSlot()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
