//
//  GeometryReaderStateUpdate.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 05/06/21.
//

import SwiftUI

struct GeometryReaderStateUpdate: View {
    @State var timesCalled = 0
    
    // Validation to only get the frame once
    @ViewBuilder
    func geometryReader() -> some View {
        if timesCalled < 1 {
            GeometryReader { geometry -> Color in
                DispatchQueue.main.async {
                    timesCalled += 1
                }
                return Color.clear
            }
        } else {
            EmptyView()
        }
    }

    var body: some View {
        VStack() {
            Text("\(timesCalled)")
                .overlay(geometryReader())
            Text("This view presents a solution to updating a @State inside a GeometryReader. It will only get it once.\nAny other method creates an infinite loop.")
                .padding()
        }
    }
}

struct GeometryReaderStateUpdate_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderStateUpdate()
    }
}
