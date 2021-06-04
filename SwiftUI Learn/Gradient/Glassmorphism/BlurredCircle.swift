//
//  BlurredCircle.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 02/06/21.
//

import SwiftUI

struct BlurredCircle: View {
    
    @State var colors: [Color]
    @State var diameter: CGFloat
    
    private var diagonalGradient: LinearGradient
    
    init(_ colors: [Color] = [Color(#colorLiteral(red: 0.5567956567, green: 0.9469813704, blue: 0.9331197143, alpha: 1)), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.3)],
         diameter: CGFloat = 200
    ) {
        self.colors = colors
        self.diagonalGradient = LinearGradient(
            gradient: Gradient(colors: colors),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        self.diameter = diameter
    }
    
    var body: some View {
        diagonalGradient
            .clipShape(Circle())
            .frame(width: diameter,
                   height: diameter,
                   alignment: .topLeading)
            .opacity(0.5)
            .shadow(radius: 5, x: 10, y: 10)
    }
}

struct BlurredCircle_Previews: PreviewProvider {
    static var previews: some View {
        BlurredCircle()
    }
}
