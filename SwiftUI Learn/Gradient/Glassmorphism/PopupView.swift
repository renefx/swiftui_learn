//
//  PopupView.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 31/05/21.
//

import SwiftUI

struct PopupView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.white.opacity(0.3)
                .frame(width: 300, height: 400)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(radius: 5, x: 10, y: 10)
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Glassmorphism")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                
                Text("Wow, what a beautiful screen".uppercased())
                    .font(.caption)
                
                Text("This could be your body text. If you are enjoying this video, like and subscribe.")
                    .font(.footnote)
            }
            .padding()
            .frame(width: 300, height: 400)
            .foregroundColor(Color.black.opacity(0.8))
            
        }
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView()
    }
}
