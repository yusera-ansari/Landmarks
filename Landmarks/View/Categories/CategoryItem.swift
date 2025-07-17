//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Abcom on 17/07/25.
//
import SwiftUI
struct CategoryItem : View{
    var landmark:Landmark
    var body:some View{
        VStack(alignment:.leading){
            landmark.image
                .resizable()
                .renderingMode(.original)
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            
            Text(landmark.name)
//                .foregroundColor(.primary)
                .font(.caption)
        }.padding(.leading, 15)
    }
}
#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
