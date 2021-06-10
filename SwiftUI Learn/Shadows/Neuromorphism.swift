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
