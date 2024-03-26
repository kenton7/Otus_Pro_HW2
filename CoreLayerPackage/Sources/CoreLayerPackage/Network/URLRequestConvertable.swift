//
//  URLRequestConvertable.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 12.02.2024.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

public protocol URLRequestConvertable {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var urlQuery: [String: String] { get }
    var headers: [String: String] { get }
    var body: [String: Any] { get }
    var method: HTTPMethod { get }
}

extension URLRequestConvertable {
    public var scheme: String { "https" }
    public var host: String { "newsapi.org" }
    public var urlQuery: [String: String] { [:] }
    public var headers: [String: String] { [:] }
    public var body: [String: Any] { [:] }
    
    func asRequest() throws -> URLRequest {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        
        if !urlQuery.isEmpty {
            let queryItems = urlQuery.map {
                URLQueryItem(name: $0, value: $1)
            }
            components.queryItems = queryItems
        }
        
        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        
        print(url)
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        
        if !body.isEmpty {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }
        return request
    }
}
