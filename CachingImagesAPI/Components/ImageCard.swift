//
//  ImageCard.swift
//  CachingImagesAPI
//
//  Created by Marek Roslik on 11.02.22.
//

import SwiftUI

struct ImageCard: View {
    var image: Photo
    
    var body: some View {
        VStack() {
            AsyncImage(url: URL(string: image.src.medium)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFill()
                    .frame(width: 160, height: 250)
                    .clipped()
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                    .frame(width: 160, height: 250)
            }        }
    }
}

struct ImageCard_Previews: PreviewProvider {
    static var previews: some View {
        ImageCard(image: previewResponseBody.photos[0])
    }
}
