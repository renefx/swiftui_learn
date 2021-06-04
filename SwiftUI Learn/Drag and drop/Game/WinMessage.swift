//
//  WinMessage.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 04/06/21.
//

import SwiftUI

struct WinMessage: View {
    @ObservedObject var model: DragViewModel
    
    var body: some View {
        ZStack(alignment: .center) {
            ColoredText(text: "CONGRATS", textColors: [Color(#colorLiteral(red: 0.9205427766, green: 0.1769670546, blue: 0.475453496, alpha: 1)),
                                                            Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)),
                                                            Color(#colorLiteral(red: 0.1973657012, green: 0.7339946628, blue: 0.9673123956, alpha: 1)),
                                                            Color(#colorLiteral(red: 0.6500930786, green: 0.9558833241, blue: 0.9664952159, alpha: 1))], background: .white)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .center
        )
        .onTapGesture {
            model.won = false
            model.dragOffset = .zero
        }
    }
}
    
struct WinMessage_Previews: PreviewProvider {
    static var previews: some View {
        WinMessage(model: DragViewModel())
    }
}
