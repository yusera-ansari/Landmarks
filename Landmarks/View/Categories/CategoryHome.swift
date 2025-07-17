//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Abcom on 17/07/25.
//

import SwiftUI
//You use navigation split views along with NavigationLink instances and related modifiers to build hierarchical navigation structures in your app.
struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    var body: some View {
        NavigationSplitView{
            List{
                modelData.features[0].image
                    .resizable()
                    .frame(height:200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self){
                    k in
                    CategoryRow(categoryName: k, items: modelData.categories[k]!)
                    
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(Visibility.hidden)
            }
//            .listStyle(.plain)
            
            .navigationTitle("Featured")
        }detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
