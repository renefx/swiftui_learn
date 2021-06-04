//
//  DragObjectView.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 04/06/21.
//

import SwiftUI

struct DragObjectView: View {
    @ObservedObject var model: DragViewModel
    
    private let animation = Animation.easeOut(duration: 0.2)
    
    private let circleColors = [
        Color(#colorLiteral(red: 0.3310189843, green: 0.6638725996, blue: 0.8391952515, alpha: 1)),
        Color(#colorLiteral(red: 0.3968602419, green: 0.4324681163, blue: 0.9220615029, alpha: 1)),
        Color(#colorLiteral(red: 0.7347484827, green: 0.2661170661, blue: 0.9037510753, alpha: 1))]
    
    var body: some View {
        ZStack() {
            
            GradientCircle(colors: circleColors)
                .frame(width: 80)
                .overlay(
                    GeometryReader { geometry -> Color in
                        DispatchQueue.main.async {
                            model.objectFrame = geometry.frame(in: .global) // in window
                        }
                        return Color.clear
                    }
                )
                .overlay(
                    Text("DRAG")
                        .fontWeight(.black)
                        .foregroundColor(.white))
                .offset(model.dragOffset)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            model.dragOffset = gesture.translation
                            if model.isAbove(model.objectFrame, model.targetFrame) {
                                print("\(model.objectFrame)\n\(model.targetFrame)")
                                model.won = true
                            }
                        }
                        .onEnded { gesture in
                            withAnimation(animation) {
                                model.dragOffset = .zero
                            }
                        }
                )
            
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        ).padding()
    }
}

struct DragObjectView_Previews: PreviewProvider {
    static var previews: some View {
        DragObjectView(model: DragViewModel())
    }
}
