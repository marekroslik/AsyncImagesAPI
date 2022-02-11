//
//  APIManager.swift
//  CachingImagesAPI
//
//  Created by Marek Roslik on 11.02.22.
//

import Foundation

enum Query: String, CaseIterable {
    case nature, amimals, people, ocean, food
}


struct GetImagesResponseBody: Decodable{
    var totalResults: Int
    var page: Int
    var perPage: Int
    var photos: [Photo]
    var nextPage: String
}

struct Photo: Identifiable, Decodable {
    var id: Int
    var width: Int
    var height: Int
    var url: String
    var photographer: String
    var photographerUrl: String
    var photographerId: Int
    var avgColor: String
    var src: ImageSrc
    var liked: Bool
    var alt: String
    struct ImageSrc: Decodable{
        var original: String
        var large2x: String
        var large: String
        var medium: String
        var small: String
        var portrait: String
        var landscape: String
        var tiny: String
    }

}




