//
//  NewsEndpoints.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 12.02.2024.
//

import Foundation

enum NewsEndpoints: URLRequestConvertable {
    case everything(about: String, pageSize: Int, page: Int)
    case topHeadlines(country: String, pageSize: Int, page: Int)
    
    var path: String {
        switch self {
        case .everything:
            return "/v2/everything"
        case .topHeadlines:
            return "/v2/top-headlines"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var urlQuery: [String: String] {
        switch self {
//        case .everything(let about):
//            return ["q": "\(about)", "apiKey": "\(APIKey.apiKey)"]
        case .everything(let about, let pageSize, let page):
            return ["q": "\(about)", "apiKey": "\(APIKey.apiKey)", "pageSize": "\(pageSize)", "page": "\(page)"]
        case .topHeadlines(let country, let pageSize, let page):
            return ["country": "\(country)", "apiKey": "\(APIKey.apiKey)", "category": "science", "pageSize": "\(pageSize)", "page": "\(page)"]
        }
    }
}
