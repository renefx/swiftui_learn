//
//  TargetView.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 04/06/21.
//

import SwiftUI

struct TargetView: View {
    @ObservedObject var model: DragViewModel
    
    private let circleColors = [
        Color.white.opacity(0.7),
        Color.white.opacity(0.01)]
    
    var body: some View {
        ZStack() {
            GradientCircle(colors: circleColors)
                .frame(width: 90)
                .overlay(
                    GeometryReader { geometry -> Color in
                        DispatchQueue.main.async {
                            model.targetFrame = geometry.frame(in: .global) // in window
                        }
                        return Color.clear
                    }
                )
                .overlay(
                    Text("HERE")
                        .fontWeight(.black)
                        .foregroundColor(.white))
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .bottomTrailing
        )
        .padding()
    }
}

struct TargetView_Previews: PreviewProvider {
    static var previews: some View {
        TargetView(model: DragViewModel())
    }
}
