//
//  SemiCircle.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 09/06/21.
//

import SwiftUI

struct SemiCircle: View {
    var color: Color = .white
    var bottomColor: Color? = nil
    var hardShadow: Color = Color(#colorLiteral(red: 0.7544506788, green: 0.8096687198, blue: 0.9181824327, alpha: 1))
    var softShadow: Color = Color(#colorLiteral(red: 0.9764556289, green: 0.9694798589, blue: 0.9817971587, alpha: 1))
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let w = geometry.size.width
                let h = geometry.size.height

                path.addArc(center: CGPoint(x: w/2, y: h*3/4), radius: w/2, startAngle: .degrees(0), endAngle: .degrees(180), clockwise: true)
            }.below()
        }
    }
}

struct SemiCircle_Previews: PreviewProvider {
    static var previews: some View {
        SemiCircle()
    }
}
