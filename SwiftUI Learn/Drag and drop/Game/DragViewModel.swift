//
//  DragViewModel.swift
//  SwiftUI Learn
//
//  Created by Rene Freire Xavier on 04/06/21.
//

import Foundation
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
