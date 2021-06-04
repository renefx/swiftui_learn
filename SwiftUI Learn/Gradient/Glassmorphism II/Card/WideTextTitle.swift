//
//  WideTextTitle.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 03/06/21.
//

import SwiftUI

struct WideTextTitle: View {
    var text: String = "Message"
    var textColor: Color = .black
    var font: Font = .system(size: 18)
    var body: some View {
        Text(text.uppercased())
            .font(font)
            .fontWeight(.semibold)
            .foregroundColor(textColor)
            .multilineTextAlignment(.leading)
            .frame(
                maxWidth: .infinity,
                alignment: .topLeading
            )
    }
}

struct WideTextTitle_Previews: PreviewProvider {
    static var previews: some View {
        WideTextTitle()
    }
}
