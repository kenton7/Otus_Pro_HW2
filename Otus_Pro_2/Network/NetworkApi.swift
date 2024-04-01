//
//  NetworkApi.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 29.03.2024.
//

import Foundation
import Combine

class NetworkApi {
    
    static let shared = NetworkApi()
    
    private init() {}
    
    public func fetchArticles(from endpoint: Endpoint) -> AnyPublisher<[Article], Never> {
        
        guard let url = endpoint.absoluteURL else {
            return Just([Article]()).eraseToAnyPublisher()
        }
        
        print(url)
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data }
            .decode(type: EverythingNewsModel.self, decoder: APIConstants.jsonDecoder)
            .map { $0.articles ?? [] }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    public func fetch<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: T.self, decoder: APIConstants.jsonDecoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
}
