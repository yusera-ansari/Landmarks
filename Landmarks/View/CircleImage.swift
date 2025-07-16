//
//  CircleImage.swift
//  Landmarks
//
//  Created by yusera-ansari on 16/07/25.
//
import SwiftUI

struct CircleImage : View{
    var body:some View{
        Image("turtlerock")
            .cornerRadius(.infinity)
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }.shadow(radius: 7)
        
    }
}

#Preview {
    CircleImage()
}
