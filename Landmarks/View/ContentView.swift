//
//  ContentView.swift
//  Landmarks
//
//  Created by Abcom on 16/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       LandmarkList()
    }
}

#Preview {
    ContentView().environment(ModelData())
}
