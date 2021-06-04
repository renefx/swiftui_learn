//
//  ColoredText.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 03/06/21.
//

import SwiftUI

struct ColoredText: View {
    var text: String
    var background: Color
    
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .foregroundColor(Color.white)
            .padding()
            .background(background)
            .cornerRadius(10)
    }
}

struct ColoredText_Previews: PreviewProvider {
    static var previews: some View {
        ColoredText(text: "Hello", background: .green)
    }
}
