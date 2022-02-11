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

@MainActor class APIManager: ObservableObject {
    @Published private(set) var images: [Photo] = []
    @Published var selectedQuery: Query = Query.nature {
        didSet {
            Task.init {
                await findImages(topic: selectedQuery)
            }
        }
    }
    
    init(){
        Task.init{
            await findImages(topic: selectedQuery)
        }
    }
    
    func findImages(topic: Query) async {
        do {
            guard let url = URL(string: "https://api.pexels.com/v1/search?query=\(topic))&per_page=20&orientation=portrait")
            else {fatalError("Missing URL") }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.setValue("563492ad6f917000010000013719edd02ee74294bdb8cd9f94cf586e", forHTTPHeaderField: "Authorization")
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching")}
            
            let decoder  = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decoderData = try decoder.decode(GetImagesResponseBody.self, from: data)
            
            self.images = []
            self.images = decoderData.photos
            
        } catch {
            print("Error fetching \(error)")
        }
    }
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




