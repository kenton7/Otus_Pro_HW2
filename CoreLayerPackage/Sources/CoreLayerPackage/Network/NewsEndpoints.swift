//
//  NewsEndpoints.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 12.02.2024.
//

import Foundation

public enum NewsEndpoints: URLRequestConvertable {
    case everything(about: String, pageSize: Int, page: Int)
    case topHeadlines(country: String, pageSize: Int, page: Int)
    
    public var path: String {
        switch self {
        case .everything:
            return "/v2/everything"
        case .topHeadlines:
            return "/v2/top-headlines"
        }
    }
    
    public var method: HTTPMethod {
        return .get
    }
    
    public var urlQuery: [String: String] {
        switch self {
        case .everything(let about, let pageSize, let page):
            return ["q": "\(about)", "apiKey": "8d9c4c6228b646c1a5b58b84c36a6982", "pageSize": "\(pageSize)", "page": "\(page)"]
        case .topHeadlines(let country, let pageSize, let page):
            return ["country": "\(country)", "apiKey": "8d9c4c6228b646c1a5b58b84c36a6982", "category": "science", "pageSize": "\(pageSize)", "page": "\(page)"]
        }
    }
}
