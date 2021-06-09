//
//  OverlayRabbit.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 09/06/21.
//

import SwiftUI

struct OverlayRabbit: ViewModifier {
    var padding: CGFloat
    func body(content: Content) -> some View {
        content
            .overlay(
                Image(systemName: "hare.fill")
                    .resizable()
                    .padding(padding))
    }
}

extension View {
    func rabbitIconOver(padding: CGFloat = 0) -> ModifiedContent<Self, OverlayRabbit> {
        return modifier(OverlayRabbit(padding: padding))
    }
}

struct OverlayRabbit_Previews: PreviewProvider {
    static var previews: some View {
        Rectangle().fill(Color.blue).rabbitIconOver(padding: 100)
    }
}
