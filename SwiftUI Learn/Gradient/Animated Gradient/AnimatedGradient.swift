//
//  AnimatedGradient.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 09/06/21.
//

import SwiftUI

struct AnimatedGradient: View {
    @State var start = UnitPoint(x: 0, y: -2)
    @State var end = UnitPoint(x: 4, y: 0)
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    let colors = [Color.blue, Color.red, Color.purple, Color.pink, Color.yellow, Color.green, Color.orange]
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
            .animation(Animation.easeInOut(duration: 6).repeatForever())
            .onReceive(timer, perform: { _ in
                
                self.start = UnitPoint(x: 4, y: 0)
                self.end = UnitPoint(x: 0, y: 2)
                self.start = UnitPoint(x: -4, y: 20)
                self.start = UnitPoint(x: 4, y: 0)
            })
    }
}

struct AnimatedGradient_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedGradient().scaleEffect(1.3).edgesIgnoringSafeArea(.all)
            .blur(radius: 50)
    }
}
