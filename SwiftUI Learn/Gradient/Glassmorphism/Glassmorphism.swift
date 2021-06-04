//
//  Glassmorphism.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 31/05/21.
//

import SwiftUI

struct Glassmorphism: View {
    @State var offsetBigBall: (CGFloat, CGFloat) = (50, -200)
    @State var offsetX1: CGFloat = -150
    @State var offsetY1: CGFloat = -25
    
    private let animation = Animation
                        .easeInOut(duration: 8.0)
                        .repeatForever(autoreverses: true)
    
    private let colorsBigCircle = [Color(#colorLiteral(red: 0.3447287083, green: 0.2482087016, blue: 0.6252382994, alpha: 1)),
                                   Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)),
                                   Color(#colorLiteral(red: 0.712551415, green: 0.8789604902, blue: 0.9714465737, alpha: 1))]
    
    private let colorsSmallCircle = [Color(#colorLiteral(red: 1, green: 0.1672445834, blue: 0.1415077448, alpha: 1)),
                                   Color(#colorLiteral(red: 0.3951289058, green: 0.7672771811, blue: 0.9481498599, alpha: 1))]
    private let diameterBigCircle: CGFloat = 300
    
    private let backgroundGradient = LinearGradient(
                            gradient: Gradient(colors: [
                                                Color(#colorLiteral(red: 1, green: 0.1672445834, blue: 0.1415077448, alpha: 1)),
                                                Color(#colorLiteral(red: 0.3951289058, green: 0.7672771811, blue: 0.9481498599, alpha: 1)),
                                                Color(#colorLiteral(red: 0.2244821191, green: 0.236559689, blue: 0.5273380876, alpha: 1))]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
    
    var body: some View {
        ZStack {
            self.backgroundGradient
            
            BlurredCircle(colorsSmallCircle)
                .offset(x: offsetX1, y: offsetY1)
                .onAppear {
                    withAnimation(animation) {
                        offsetY1 -= 300
                        offsetX1 += 30
                    }
                }
            
            BlurredCircle(colorsBigCircle, diameter: diameterBigCircle)
                .offset(x: offsetBigBall.0, y: offsetBigBall.1)
                .onAppear {
                    withAnimation(animation) {
                        offsetBigBall.1 += 500
                        offsetBigBall.0 -= 80
                    }
                }
            PopupView()
        }
        .edgesIgnoringSafeArea(.all)

    }
}


struct Glassmorphism_Previews: PreviewProvider {
    static var previews: some View {
        Glassmorphism()
    }
}
