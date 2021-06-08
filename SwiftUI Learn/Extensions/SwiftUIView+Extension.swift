//
//  SwiftUIView+Extension.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 06/06/21.
//

import SwiftUI

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
            .mask(self)
    }
}
