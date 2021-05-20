//
//  PieTable.swift
//  ServiceProvider14Ap
//
//  Created by asli on 1.05.2021.
//

import SwiftUI

struct PieTable: View {
    fileprivate var pieces: [Piece] = []
    
    init(_ values: [(Color, Double)]) {
        pieces = calculateSlices(from: values)
    }
    
    var body: some View {
        GeometryReader { reader in
            let halfWidth = (reader.size.width / 2)
            let halfHeight = (reader.size.height / 2)
            let radius =  min(halfWidth, halfHeight)
            let center = CGPoint(x: halfWidth, y: halfHeight)
            ZStack(alignment: .center) {
                ForEach(pieces, id: \.self) { slice in
                    Path { path in
                        path.move(to: center)
                        path.addArc(center: center, radius: radius, startAngle: slice.start, endAngle: slice.end, clockwise: false)
                    }
                    .fill(slice.color)
                    
                }
            }
        }
    }
    
    private func calculateSlices(from inputValues: [(color: Color, value: Double)]) -> [Piece] {
                
        let sumOfAllValues = inputValues.reduce(0) { $0 + $1.value }
        
        guard sumOfAllValues > 0 else {
            return []
        }
        
        let degreeForOneValue = 360.0 / sumOfAllValues
        var currentStartAngle = 0.0
        var pieces = [Piece]()
        inputValues.forEach { inputValue in
            let endAngle = degreeForOneValue * inputValue.value + currentStartAngle
            pieces.append(Piece(start: Angle(degrees: currentStartAngle), end: Angle(degrees: endAngle),color: inputValue.color))
            currentStartAngle = endAngle
        }

        return pieces
    }
}

private struct Piece : Hashable {
    var start: Angle
    var end: Angle
    var color: Color
}

struct PieTable_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PieTable([
                (Color(red: 0.4, green: 0.6, blue: 0.6), 50),
                (Color(red: 0.0, green: 0.9, blue: 1.0), 50),
                (Color(red: 0.2, green: 0.2, blue: 0.4), 50)
            ])
            PieTable([
                (Color("grass"), 1),
                (Color("orangex"), 2),
                (Color(red: 1.0, green: 0.5, blue: 0.5), 3),
                (Color("fushia"), 4)
            ])
        }
    }
}
