//
//  DemoCompatibleFullScreen.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 18/07/21.
//

import SwiftUI

struct DemoCompatibleFullScreen: View {
    @State private var activateFullScreen = false
    @State private var activateSheet = false
    var body: some View {
        VStack {
            Button("Full Screen Toggle") { self.activateFullScreen.toggle() }
                .compatibleFullScreen(isPresented: $activateFullScreen) {
                    
                    VStack {
                        Text("I'm in Full Screen!")
                        Button("Dismiss") { self.activateFullScreen.toggle() }
                    }.background(Color.red)
                }
            Button("Sheet Toggle") { self.activateSheet.toggle() }
        }
        .sheet(isPresented: self.$activateSheet) { Text("I'm in a Sheet!")
        }
    }
}

extension View {
    func compatibleFullScreen<Content: View>(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) -> some View {
        self.modifier(FullScreenModifier(isPresented: isPresented, builder: content))
    }
}

struct FullScreenModifier<V: View>: ViewModifier {
    let isPresented: Binding<Bool>
    let builder: () -> V

    @ViewBuilder
    func body(content: Content) -> some View {
        if #available(iOS 14.0, *) {
            content.fullScreenCover(isPresented: isPresented, content: builder)
        } else {
            content.sheet(isPresented: isPresented, content: builder)
        }
    }
}


struct DemoCompatibleFullScreen_Previews: PreviewProvider {
    static var previews: some View {
        DemoCompatibleFullScreen()
    }
}
