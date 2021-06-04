//
//  ViewOverAnother.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 03/06/21.
//

import SwiftUI

struct ViewOverAnother: View {
    @State var firstFrame = CGRect()
    @State var secondFrame = CGRect()
    @State var thirdFrame = CGRect()
    @State var textResultsOk = "ok!"
    @State var textResultsApart = "apart!"
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Text("Test first and second view!")
                .overlay(
                    GeometryReader { geometry -> Color in
                        DispatchQueue.main.async {
                            firstFrame = geometry.frame(in: .global) // in window
                        }
                        return Color.clear
                    }.background(Color.purple)
                ).onAppear {
                    $textResultsOk.wrappedValue = isAbove(firstFrame,secondFrame) ? "correto em cima" : "errado em cima"
                    textResultsApart = !isAbove(firstFrame,thirdFrame) ? "correto longe" : "errado longe"
                }
            Text("Test first and second view!")
                .overlay(
                    GeometryReader { geometry -> Color in
                        DispatchQueue.main.async {
                            secondFrame = geometry.frame(in: .global) // in window
                        }
                        return Color.clear
                    }
                )
            VStack() {
                Text("Test view out!")
                    .overlay(
                        GeometryReader { geometry -> Color in
                            DispatchQueue.main.async {
                                thirdFrame = geometry.frame(in: .global) // in window
                            }
                            return Color.clear
                        }.background(Color.green)
                    )
                Spacer()
            }
            VStack() {
                Spacer()
                Text("Results!")
                Text("\(textResultsOk)")
                Text("\(textResultsApart)")
                Spacer()
            }
            
        }
    }
    
    func isAbove(_ this: CGRect, _ other: CGRect) -> Bool {
//        print("\(this) \n\n \(other)")
        let x = CGRect(x: 0, y: 0, width: 5, height: 5)
        let y = CGRect(x: 0, y: 0, width: 5, height: 5)
        let z = CGRect(x: 2.5, y: 0, width: 5, height: 5)
        print("------------")
        print(x.intersects(y))
        print(percentageAbove(x, y))
        print(x.intersects(z))
        print(percentageAbove(x, z))
        return this.intersects(other)
    }
    
    func percentageAbove(_ this: CGRect, _ other: CGRect) -> CGFloat {
        
        let interRect:CGRect = this.intersection(other)
        let areaInterRect = interRect.width * interRect.height
        let areaThis = this.width * this.height
        let areaOther = other.width * other.height

        return (areaInterRect / ((areaThis + areaOther)/2.0) * 100.0)
    }
}

struct ViewOverAnother_Previews: PreviewProvider {
    static var previews: some View {
        ViewOverAnother()
    }
}
