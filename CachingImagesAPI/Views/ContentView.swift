//
//  ContentView.swift
//  CachingImagesAPI
//
//  Created by Marek Roslik on 11.02.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var apiManager = APIManager()
    
    
    var body: some View {
        VStack {
            if apiManager.images.isEmpty {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ScrollView() {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))], spacing: 10) {
                            ForEach (apiManager.images, id: \.id) { image in
                                ImageCard(image: image)
                            }
                        }
                        .padding(0)
                
                    
                }
                .frame(maxWidth: .infinity)
            }
            
            HStack() {
                ForEach(Query.allCases, id: \.self) { searchQuery in
                    QueryTag(query: searchQuery, isSelected: apiManager.selectedQuery == searchQuery)
                        .onTapGesture {
                            apiManager.selectedQuery = searchQuery
                        }
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
