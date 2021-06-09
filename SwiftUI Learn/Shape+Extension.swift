//
//  Shape+Extension.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 09/06/21.
//

import SwiftUI

extension Shape {
    func above(fillColor: Color = .white,
               padding: CGFloat = 7,
               hardShadow: Color = Color(#colorLiteral(red: 0.7544506788, green: 0.8096687198, blue: 0.9181824327, alpha: 1)),
               softShadow: Color = Color(#colorLiteral(red: 0.9764556289, green: 0.9694798589, blue: 0.9817971587, alpha: 1))) -> some View {
        return self
                .fill(fillColor)
                .padding(padding)
                .shadow(color: hardShadow,
                        radius: 3, x: 5, y: 5)
                .shadow(color: softShadow,
                        radius: 2, x: -2, y: -2)
    }
    
    func lineAbove(strokeColor: Color = .white,
                   lineWidth: CGFloat = 9,
                   hardShadow: Color = Color(#colorLiteral(red: 0.7544506788, green: 0.8096687198, blue: 0.9181824327, alpha: 1)),
                   softShadow: Color = Color(#colorLiteral(red: 0.9764556289, green: 0.9694798589, blue: 0.9817971587, alpha: 1))) -> some View {
        return self
                .stroke(strokeColor,
                        lineWidth: lineWidth)
                .padding(lineWidth + 4)
                .shadow(color: hardShadow,
                        radius: 3, x: 5, y: 5)
                .shadow(color: softShadow,
                        radius: 2, x: -2, y: -2)
    }
    
    func below(colors: [Color] = [.white],
               bottomColor: [Color]? = nil,
               hardShadow: Color = Color(#colorLiteral(red: 0.7544506788, green: 0.8096687198, blue: 0.9181824327, alpha: 1)),
               softShadow: Color = Color(#colorLiteral(red: 0.9764556289, green: 0.9694798589, blue: 0.9817971587, alpha: 1))) -> some View {
        let gradient = Gradient(colors: colors)
        let linearGradient = LinearGradient(
                                    gradient: gradient,
                                    startPoint: .leading,
                                    endPoint: .trailing)
        let gradientBottom = Gradient(colors: (bottomColor ?? colors))
        let linearGradientBottom = LinearGradient(
                                gradient: gradientBottom,
                                startPoint: .leading,
                                endPoint: .trailing)
        return self
            .stroke(linearGradient,
                    lineWidth: 7)
            .shadow(color: hardShadow,
                    radius: 3, x: 5, y: 5)
            .shadow(color: softShadow,
                    radius: 2, x: -2, y: -2)
            .clipShape(self)
            .background(linearGradientBottom.clipShape(self))
    }
}
