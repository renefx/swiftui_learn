//
//  Neuromorphism.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 07/06/21.
//

import SwiftUI

struct Neuromorphism: View {
    var body: some View {
        ZStack() {
            VStack() {
                HStack() {
                    Circle()
                        .above()
                        .rabbitIconOver(padding: 35)
                    
                    Rectangle()
                        .above()
                        .rabbitIconOver(padding: 35)
                    
                    RoundedRectangle(cornerRadius: 25.0)
                        .above()
                        .rabbitIconOver(padding: 35)
                }.frame(maxHeight: 100).padding()
                
                HStack() {
                    Circle().lineAbove()
                        .rabbitIconOver(padding: 38)
                    
                    Rectangle().lineAbove()
                        .rabbitIconOver(padding: 37)
                    
                    RoundedRectangle(cornerRadius: 25)
                        .lineAbove()
                        .rabbitIconOver(padding: 37)
                }.frame(maxHeight: 100).padding()
                
                HStack() {
                    Circle().below()
                        .rabbitIconOver(padding: 33)
                    
                    Rectangle().below()
                        .rabbitIconOver(padding: 37)
                    
                    RoundedRectangle(cornerRadius: 25)
                        .below()
                        .rabbitIconOver(padding: 33)
                }.frame(maxHeight: 100).padding()
                
                HStack() {
                    Trapeze()
                        .overlay(
                            Image(systemName: "hare.fill")
                                .resizable()
                                .padding(40)
                                .offset(x: 10.0, y: 10.0))
                    
                    ArcView()
                    
                    SemiCircle()
                        .overlay(
                            Image(systemName: "hare.fill")
                                .resizable()
                                .padding(40)
                                .offset(y: 10.0))
                        
                }.frame(maxHeight: 100).padding()
                
                ZStack() {
                    LinearGradient(gradient: Gradient(colors: [.gray, .white, ]), startPoint: .leading, endPoint: .trailing)
                    HStack() {
                        Trapeze(
                            hardShadow: .gray,
                            softShadow: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                            .frame(maxHeight: 100)
                            .padding(.bottom, 15)
                        
                        ArcView(
                            hardShadow: .gray,
                            softShadow: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                        
                        SemiCircle()
                            .shadow(color: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)),
                                    radius: 3, x: 5, y: 5)
                            .shadow(color: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)),
                                    radius: 2, x: -2, y: -2)
                    }
                }.frame(maxHeight: 100).padding()
            }
        }
    }
}

struct Neuromorphism_Previews: PreviewProvider {
    static var previews: some View {
        Neuromorphism()
    }
}


struct RingView: View {
    var color1  = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    var color2  = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    var width: CGFloat = 300
    var height: CGFloat = 300
    var percent: CGFloat = 88
    @Binding var show : Bool
    
    var body: some View {
        let multiplier = width / 44
        let progress = 1 - (percent / 100)
        
        return ZStack {
//            Circle()
//                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
//                .frame(width: width, height: height)
            
            Circle()
//                .fill(Color.white)
//                .trim(from: progress, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
                )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: height)
                .shadow(color: Color(color2).opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
                .shadow(color: Color(#colorLiteral(red: 0.1891615391, green: 0.03714629263, blue: 0.5007147193, alpha: 1)), radius: 6, x: 10, y: 10)
                .shadow(color: Color(#colorLiteral(red: 0.6106063128, green: 0.5005851388, blue: 0.9590403438, alpha: 1)), radius: 6, x: -10, y: -10)
            
               
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}
