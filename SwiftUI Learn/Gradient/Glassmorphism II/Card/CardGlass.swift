//
//  CardGlass.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 03/06/21.
//

import SwiftUI

struct CardGlass: View {
    var colors: [Color]
    var gradientBackground: LinearGradient
    
    init(colors: [Color] = [.red, .clear]) {
        self.colors = colors
        gradientBackground = LinearGradient(
                                gradient: .init(colors: colors),
                                startPoint: .topLeading,
                                endPoint: .topTrailing)
    }
    
    var body: some View {
        VStack() {
            FormerElementsCard(bankName: "Superbank", cardNumber: "1234 5678 1234 5678")
            
            
            LatterElementsCard(validDate: "12/28", holderName: "Rene x")
                .clipped()
                .background(gradientBackground)
        }
        .aspectRatio(1.5, contentMode: .fill)
        .background(
            Color.white.blur(radius: 30.0)
        )
        .cornerRadius(30)
        .shadow(radius: 6, x: 10, y: 10)
        .aspectRatio(1.5, contentMode: .fit)
        .frame(maxWidth: UIScreen.main.bounds.size.width * 0.8,
               maxHeight: UIScreen.main.bounds.size.width * 0.8)
    }
}

struct CardGlass_Previews: PreviewProvider {
    static var previews: some View {
        CardGlass()
    }
}
