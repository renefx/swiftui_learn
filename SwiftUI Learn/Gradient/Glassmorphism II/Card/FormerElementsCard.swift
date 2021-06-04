//
//  FormerElementsCard.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 03/06/21.
//

import SwiftUI

struct FormerElementsCard: View {
    @State var bankName: String
    @State var cardNumber: String
    
    var body: some View {
        VStack() {
            WideTextTitle(text: bankName)
                .opacity(0.5)
            Spacer()
            WideTextTitle(text: cardNumber)
        }
        .padding(.leading, 20)
        .padding(.top, 25)
        .padding(.bottom, 5)
    }
}

struct FormerElementsCard_Previews: PreviewProvider {
    static var previews: some View {
        FormerElementsCard(bankName: "Superbank", cardNumber: "1234 5678 1234 5678")
    }
}
