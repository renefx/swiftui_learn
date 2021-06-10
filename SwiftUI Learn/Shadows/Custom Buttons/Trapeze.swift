//
//  Trapeze.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 09/06/21.
//

import SwiftUI

struct Trapeze: View {
    var fillColor: Color = .white
    var padding: CGFloat = 7
    var hardShadow: Color = Color(#colorLiteral(red: 0.7544506788, green: 0.8096687198, blue: 0.9181824327, alpha: 1))
    var softShadow: Color = Color(#colorLiteral(red: 0.9764556289, green: 0.9694798589, blue: 0.9817971587, alpha: 1))
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let (width, height) = (geometry.size.width, geometry.size.height)
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: width/2, y: height))
                path.addLine(to: CGPoint(x: width, y: height))
                path.addLine(to: CGPoint(x: width/2, y: 0))
            }.above(
                fillColor: fillColor,
                padding: padding,
                hardShadow: hardShadow,
                softShadow: softShadow)
        }
    }
}

struct Trapeze_Previews: PreviewProvider {
    static var previews: some View {
        Trapeze()
    }
}
