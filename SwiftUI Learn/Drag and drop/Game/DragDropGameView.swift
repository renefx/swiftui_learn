//
//  DragDropGameView.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 28/05/21.
//

import SwiftUI

struct DragDropGameView: View {
    @StateObject var model = DragViewModel()
    
    private let backgroundGradient = RadialGradient(
                                        gradient:
                                            Gradient(colors:
                                                        [Color(#colorLiteral(red: 0.9205427766, green: 0.1769670546, blue: 0.475453496, alpha: 1)),
                                                         Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)),
                                                         Color(#colorLiteral(red: 0.1973657012, green: 0.7339946628, blue: 0.9673123956, alpha: 1)),
                                                         Color(#colorLiteral(red: 0.6500930786, green: 0.9558833241, blue: 0.9664952159, alpha: 1))]),
                                        center: .bottom,
                                        startRadius: 50,
                                        endRadius: 500)

    var body: some View {
        ZStack(alignment: .center) {
            self.backgroundGradient
                .ignoresSafeArea()
            if model.won {
                WinMessage(model: model)
            } else {
                TargetView(model: model)
                DragObjectView(model: model)
            }
        }.animation(.default)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DragDropGameView()
    }
}
