//
//  FeatureCard.swift
//  Landmarks
//
//  Created by Abcom on 18/07/25.
//

import SwiftUI

//Include the aspect ratio modifier so it mimics the aspect ratio of the view where FeatureCard will eventually preview later

struct FeatureCard: View {
    var landmark : Landmark
    var body: some View {
        landmark.featureImage?
            .resizable()
            .overlay{
                TextOverylay(landmark:landmark)
            }
        
    }
}

//Key Points:
//ZStack lays out views on top of each other, and the size of the ZStack will match the size of the largest view inside it.
//
//Your gradient view has no intrinsic size because it is just a background color, so it expands to fill all available space by default.
//
//This causes the ZStack to expand, and since you’ve set the alignment to .bottomLeading, the VStack is aligned to the bottom-left of that large area.

struct TextOverylay : View{
    var landmark : Landmark
    var gradient: LinearGradient {
           .linearGradient(
               Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
               startPoint: .bottom,
               endPoint: .center)
       }
    var body : some View {
        ZStack(alignment: .bottomLeading){
            gradient
            VStack(alignment: .leading) {
                           Text(landmark.name)
                               .font(.title)
                               .bold()
                           Text(landmark.park)
                       }
                       .padding()
        }.foregroundStyle(.white)
    }
}
#Preview {
    FeatureCard(landmark: ModelData().features[0])
        .aspectRatio(3 / 2,contentMode: .fit)
}
