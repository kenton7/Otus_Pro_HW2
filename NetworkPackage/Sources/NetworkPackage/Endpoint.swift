//
//  Endpoint.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 29.03.2024.
//

import Foundation

public enum Endpoint {
    case everything(about: String)
    case topHeadlines(country: String, category: String)
    
    
    var baseURL: URL {
        URL(string: "https://newsapi.org/v2/")!
    }
    
    var absoluteURL: URL? {
            let queryURL = baseURL.appendingPathComponent(self.path())
            let components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true)
            guard var urlComponents = components else {
                return nil
            }
            switch self {
            case .topHeadlines:
                urlComponents.queryItems = [URLQueryItem(name: "country", value: "us"),
                                            URLQueryItem(name: "apikey", value: APIConstants.apiKey),
                                            URLQueryItem(name: "category", value: "science")
                                           ]
            case .everything:
                urlComponents.queryItems = [URLQueryItem(name: "q", value: "technology"),
                                            URLQueryItem(name: "apikey", value: APIConstants.apiKey)
                ]
            }
            return urlComponents.url
        }
    
    init?(index: Int) {
            switch index {
            case 0: self = .everything(about: "technology")
            case 1: self = .topHeadlines(country: "us", category: "science")
            default:
                return nil
            }
        }
    
    func path() -> String {
        switch self {
        case .everything:
            return "everything"
        case .topHeadlines:
            return "top-headlines"
        }
    }
}
