//
//  ApiConstants.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 29.03.2024.
//

import Foundation

struct APIConstants {
    static let apiKey: String = "8d9c4c6228b646c1a5b58b84c36a6982"
    
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }()
}
