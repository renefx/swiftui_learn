//
//  ColoredText.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 03/06/21.
//

import SwiftUI

struct ColoredText: View {
    var text: String
    var textColors: [Color] = [.white]
    var background: Color
    
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .gradientForeground(colors: textColors)
            .padding()
            .background(background)
            .cornerRadius(10)
    }
}

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
            .mask(self)
    }
}

struct ColoredText_Previews: PreviewProvider {
    static var previews: some View {
        ColoredText(text: "Hello", textColors: [.red, .blue, .gray], background: Color(#colorLiteral(red: 0.6500930786, green: 0.9558833241, blue: 0.9664952159, alpha: 1)))
    }
}
