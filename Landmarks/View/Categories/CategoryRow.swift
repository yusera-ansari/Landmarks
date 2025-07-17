//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Abcom on 17/07/25.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName:String
    var items:[Landmark]
    var body: some View {
        VStack(alignment:.leading){
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment:.top, spacing: 0){
                    ForEach(items){
                        item in
                        NavigationLink{
                            LandmarkDetail(landmark: item)
                            } label: {
                                CategoryItem(landmark: item)
                                  
                                    
                            }.buttonStyle(PlainButtonStyle())
                            
                            
                    }
                } .frame(height: 185)
            }
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks;
    
    return CategoryRow(
            categoryName: landmarks[2].category.rawValue,
            items: Array(landmarks.prefix(8))
        )
}
