//
//  GlassmorphismII.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 03/06/21.
//

import SwiftUI

struct GlassmorphismII: View {
    private let cardColors = [
        Color(#colorLiteral(red: 0.3310189843, green: 0.6638725996, blue: 0.8391952515, alpha: 1)),
        Color(#colorLiteral(red: 0.3968602419, green: 0.4324681163, blue: 0.9220615029, alpha: 1)),
        Color(#colorLiteral(red: 0.7347484827, green: 0.2661170661, blue: 0.9037510753, alpha: 1))]
    
    private let backgroundGradient = LinearGradient(
                            gradient: Gradient(colors: [
                                                Color(#colorLiteral(red: 0.9760726094, green: 0.7678329349, blue: 0.7517178655, alpha: 1)),
                                                Color(#colorLiteral(red: 0.9758653045, green: 0.976285398, blue: 0.9658823609, alpha: 1)),
                                                Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))]),
                            startPoint: .topTrailing,
                            endPoint: .bottomLeading)
    
    var body: some View {
        ZStack() {
            self.backgroundGradient
            GradientCircle(colors: cardColors)
                .frame(width: 270)
                .offset(x: -210, y: -400.0)
            GradientCircle(colors: cardColors)
                .frame(width: 70)
                .offset(y: -100.0)
            GradientCircle(colors: cardColors)
                .frame(width: 120)
                .offset(x: 170, y: -100.0)
            GradientCircle(colors: cardColors)
                .frame(width: 200)
                .offset(x: -200, y: 70.0)
            CardGlass(colors: cardColors)
            GradientCircle(colors: cardColors, shadowPostion: (0, 10))
                .frame(width: 100)
                .offset(x: 170, y: 80.0)
            GradientCircle(colors: cardColors, shadowPostion: (10, 10))
                .frame(width: 270)
                .offset(x: 110, y: 400.0)
        }
        .ignoresSafeArea()
    }
}

struct GlassmorphismII_Previews: PreviewProvider {
    static var previews: some View {
        GlassmorphismII()
    }
}
