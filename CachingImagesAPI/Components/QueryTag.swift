//
//  SwiftUIView.swift
//  CachingImagesAPI
//
//  Created by Marek Roslik on 11.02.22.
//

import SwiftUI

struct QueryTag: View {
    var query: Query
    var isSelected: Bool
    
    var body: some View {
        Text(query.rawValue.uppercased())
            .font(.caption2)
            .foregroundColor(.black)
            .bold()
            .foregroundColor(isSelected ? .black : .gray)
            .padding(10)
            .background(.white)
            .cornerRadius(10)
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        QueryTag(query: Query.nature, isSelected: true)
    }
}
