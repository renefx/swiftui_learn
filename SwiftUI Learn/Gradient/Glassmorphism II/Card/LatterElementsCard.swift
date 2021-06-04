//
//  LatterElementsCard.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 03/06/21.
//

import SwiftUI

struct LatterElementsCard: View {
    @State var validDate: String
    @State var holderName: String
    
    var body: some View {
        ZStack() {
            VStack() {
                WideTextTitle(
                    text: "valid thru",
                    textColor: .white,
                    font: .system(size: 6))
                WideTextTitle(
                    text: validDate,
                    textColor: .white,
                    font: .system(size: 16))
                    .padding(.bottom, 3)
                WideTextTitle(
                    text: holderName,
                    textColor: .white,
                    font: .system(size: 16))
                
            }.padding(20)
        }
    }
}

struct LatterElemntsCard_Previews: PreviewProvider {
    static var previews: some View {
        LatterElementsCard(validDate: "12/28", holderName: "Rene x")
    }
}
