//
//  ContentView.swift
//  Landmarks
//
//  Created by Abcom on 16/07/25.
//

import SwiftUI

struct ContentView: View {
    @State var selection:Tab = .featured
    enum Tab {
        case featured
        case list
    }
    var body: some View {
        TabView(selection: $selection){
            CategoryHome()
                .tabItem{
                    Label("Featured", systemImage: "star.fill")
                }
                .tag(Tab.featured)
            LandmarkList()
                .tabItem{
                Label("List", systemImage: "list.bullet")}                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView().environment(ModelData())
}
