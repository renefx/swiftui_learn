//
//  ContentView.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 28/05/21.
//

import SwiftUI

class DragViewModel: ObservableObject {
    @Published var dragOffset = CGSize.zero
    @Published var objectFrame = CGRect()
    @Published var targetFrame = CGRect()
    @Published var won = false
    
    func isAbove(_ this: CGRect, _ other: CGRect) -> Bool {
        if this.intersects(other) {
            return percentageAbove(this, other) > 60
        }
        return false
    }
    
    func percentageAbove(_ this: CGRect, _ other: CGRect) -> CGFloat {
        
        let interRect:CGRect = this.intersection(other)
        let areaInterRect = interRect.width * interRect.height
        let areaThis = this.width * this.height
        let areaOther = other.width * other.height

        return (areaInterRect / ((areaThis + areaOther)/2.0) * 100.0)
    }
}

struct ContentView: View {
    @StateObject var model = DragViewModel()
    
    private let backgroundGradient = RadialGradient(
                                        gradient:
                                            Gradient(colors:
                                                        [Color(#colorLiteral(red: 0.9205427766, green: 0.1769670546, blue: 0.475453496, alpha: 1)),
                                                         Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)),
                                                         Color(#colorLiteral(red: 0.1973657012, green: 0.7339946628, blue: 0.9673123956, alpha: 1)),
                                                         Color(#colorLiteral(red: 0.6500930786, green: 0.9558833241, blue: 0.9664952159, alpha: 1))]),
                                        center: .bottom,
                                        startRadius: 50,
                                        endRadius: 500)

    var body: some View {
        ZStack(alignment: .center) {
            self.backgroundGradient
                .ignoresSafeArea()
            if model.won {
                WinMessage(model: model)
            } else {
                TargetView(model: model)
                DragObjectView(model: model)
            }
        }
    }
}

struct WinMessage: View {
    @ObservedObject var model: DragViewModel
    
    var body: some View {
        ZStack(alignment: .center) {
            ColoredText(text: "CONGRATS", textColors: [Color(#colorLiteral(red: 0.9205427766, green: 0.1769670546, blue: 0.475453496, alpha: 1)),
                                                            Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)),
                                                            Color(#colorLiteral(red: 0.1973657012, green: 0.7339946628, blue: 0.9673123956, alpha: 1)),
                                                            Color(#colorLiteral(red: 0.6500930786, green: 0.9558833241, blue: 0.9664952159, alpha: 1))], background: .white)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .center
        )
        .onTapGesture {
            model.won = false
            model.dragOffset = .zero
        }
    }
}

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
