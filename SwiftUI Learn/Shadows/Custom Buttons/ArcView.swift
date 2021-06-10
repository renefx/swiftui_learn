//
//  ArcView.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 09/06/21.
//

import SwiftUI

struct ArcView: View {
    var strokeColor: Color = .white
    var lineWidth: CGFloat = 15
    var hardShadow: Color = Color(#colorLiteral(red: 0.7544506788, green: 0.8096687198, blue: 0.9181824327, alpha: 1))
    var softShadow: Color = Color(#colorLiteral(red: 0.9764556289, green: 0.9694798589, blue: 0.9817971587, alpha: 1))
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let w = geometry.size.width
                let h = geometry.size.height

                path.addArc(center: CGPoint(x: w/3, y:h/2), radius: w/4, startAngle: .degrees(0), endAngle: .degrees(180), clockwise: true)
            }.lineAbove(
                strokeColor: strokeColor,
                lineWidth: lineWidth,
                hardShadow: hardShadow,
                softShadow: softShadow)
        }
    }
}

struct ArcView_Previews: PreviewProvider {
    static var previews: some View {
        ArcView()
    }
}
