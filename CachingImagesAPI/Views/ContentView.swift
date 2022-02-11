//
//  ContentView.swift
//  CachingImagesAPI
//
//  Created by Marek Roslik on 11.02.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            ScrollView() {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))], spacing: 0) {
                    ForEach (1...8, id: \.self) { index in
                        ImageCard(image: previewResponseBody.photos[0])
                    }
                }
                .padding(0)
            }
            .frame(maxWidth: .infinity)
            HStack() {
                ForEach(Query.allCases, id: \.self) { searchQuery in
                    QueryTag(query: searchQuery, isSelected: false)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
        }
        .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
