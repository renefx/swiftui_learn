//
//  MagicTrick.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 06/06/21.
//

import SwiftUI


struct MagicTrick: View {
    @State private var spacing: CGFloat = CGFloat()
    @State private var imageSize: CGSize = CGSize()
    
    private var colors:[Color] = [.purple, .blue]
    
    var body: some View {
        
        let image = Image(systemName: "figure.stand")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200, alignment: .center)
            .gradientForeground(colors: colors)
            .cornerRadius(10.0)
            .background(GeometryReader { proxy in
                Color.clear.onAppear() {
                    imageSize = proxy.size
                }
            })
        
        
        return ZStack {
            VStack() {
                ColoredText(text: "Magic show", textColors: colors, background: Color.clear)
                    .font(.title)
            }.frame(maxHeight:.infinity, alignment: .top)
            VStack(spacing: spacing) {
                
                image.frame(width: imageSize.width, height: imageSize.height/2, alignment: .top).clipped()
                
                image.frame(width: imageSize.width, height: imageSize.height/2, alignment: .bottom).clipped()
            }.rotationEffect(Angle(degrees: 90)).animation(.default)
            
            VStack { Spacer(); Slider(value: $spacing,in: 0.0...100.0) }
            
        }
        .padding()
        .compositingGroup()
        .shadow(radius: 10.0)
        
    }
}


struct MagicTrick_Previews: PreviewProvider {
    static var previews: some View {
        MagicTrick()
    }
}
