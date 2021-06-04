//
//  TransparentGradient.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 02/06/21.
//

import SwiftUI

struct TransparentGradient: View {
    private let redGradient = LinearGradient(gradient: Gradient(colors: [.red, .clear]), startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.green)
                .ignoresSafeArea()
            
            
            VStack {
                Text("Simple Gradient applied to a Rectangle")
                    .multilineTextAlignment(.center)
                    .padding(.top)
                Rectangle()
                    .foregroundColor(.clear)
                    .background(redGradient)
                Text("Color is the first\nthe BLUR effect weaker accent")
                    .multilineTextAlignment(.center)
                HStack {
                    Color(.clear)
                        .background(redGradient)
                        .aspectRatio(1, contentMode: .fit)
                    
                    Color(.clear)
                        .background(redGradient)
                        .aspectRatio(1, contentMode: .fit)
                        .clipShape(Circle())
                    
                    Color(.clear)
                        .background(redGradient)
                        .aspectRatio(1, contentMode: .fit)
                        .clipShape(Circle())
                        .blur(radius: 20)
                    
                    Color(.clear)
                        .background(redGradient)
                        .opacity(0.9)
                        .aspectRatio(1, contentMode: .fit)
                        .clipShape(Circle())
                        .blur(radius: 20)
                }
                .frame(maxWidth: UIScreen.main.bounds.width - 20)
                .padding(.bottom, 10)
                
                Text("Gradient is the first\nthe BLUR effect stronger accent")
                    .multilineTextAlignment(.center)
                    .padding(.top)
                HStack {
                    
                    redGradient
                        .aspectRatio(1, contentMode: .fit)
                    
                    redGradient
                        .aspectRatio(1, contentMode: .fit)
                        .clipShape(Circle())
                    
                    redGradient
                        .aspectRatio(1, contentMode: .fit)
                        .clipShape(Circle())
                        .blur(radius: 10)
                    
                    redGradient
                        .opacity(0.9)
                        .aspectRatio(1, contentMode: .fit)
                        .clipShape(Circle())
                        .blur(radius: 10)
                }
                .frame(maxWidth: UIScreen.main.bounds.width - 20)
            }
            .frame(maxWidth: UIScreen.main.bounds.width - 20)
            .clipped()
            
        }
    }
}

struct TransparentGradient_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TransparentGradient()
        }
    }
}
