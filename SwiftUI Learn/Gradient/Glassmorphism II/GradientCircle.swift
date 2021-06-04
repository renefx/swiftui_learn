//
//  GradientCircle.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 03/06/21.
//

import SwiftUI

struct GradientCircle: View {
    var colors: [Color] = [.red, .blue]
    var shadowPostion: (CGFloat, CGFloat) = (10,10)
    var body: some View {
        LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing)
            .aspectRatio(1, contentMode: .fit)
            .clipShape(Circle())
            .shadow(color: .gray, radius: 8, x: shadowPostion.0, y: shadowPostion.1)
    }
}

struct GradientCircle_Previews: PreviewProvider {
    static var previews: some View {
        GradientCircle()
    }
}
