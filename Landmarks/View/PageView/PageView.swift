//
//  PageView.swift
//  Landmarks
//
//  Created by Abcom on 18/07/25.
//

import SwiftUI

struct PageView<Page : View>: View {
    var pages : [Page]
    @State var currentPage:Int = 1
    var body: some View {
//        VStack{
            ZStack(alignment: .bottomTrailing) {
                      PageViewController(pages: pages, currentPage: $currentPage)
                      PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                          .frame(width: CGFloat(pages.count * 18))
                          .padding(.trailing)
                  }
//            Text("Current Page: \(currentPage)")
//        }
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}

#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
}
