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
    
    private let colorsBigCircle = [Color(#colorLiteral(red: 0.3057210445, green: 0.2507614791, blue: 0.5371499062, alpha: 1)),
                                   Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)).opacity(0.8),
                                   Color(#colorLiteral(red: 0, green: 0.9756456017, blue: 0.7367306352, alpha: 1))]
    private let diameterBigCircle: CGFloat = 300
    
    private let backgroundGradient = LinearGradient(
                            gradient: Gradient(colors: [
                                                Color(#colorLiteral(red: 0, green: 0.926546216, blue: 0.8343044519, alpha: 1)).opacity(0.4),
                                                Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)).opacity(0.8),
                                                Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.9)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
    
    var body: some View {
        ZStack {
            self.backgroundGradient
            
            BlurredCircle()
                .offset(x: offsetX1, y: offsetY1)
                .onAppear {
                    withAnimation(animation) {
                        offsetY1 -= 300
                        offsetX1 += 30
                    }
                }
            
            BlurredCircle(colorsBigCircle, diameter: diameterBigCircle)
                .offset(x: offsetBigBall.0, y: offsetBigBall.1)
                .blur(radius: 2.0)
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
