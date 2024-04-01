//
//  EverythingNewsModel.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 12.02.2024.
//

import Foundation

protocol EverythingNewsProtocol {
    var status: String? { get }
    var totalResults: Int? { get }
    var articles: [Article]? { get }
}

// MARK: - EverythingNewsModel
struct EverythingNewsModel: Codable, EverythingNewsProtocol, Hashable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

// MARK: - Article
public struct Article: Codable, Hashable {
    let source: Source?
    let author: String?
    let title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source: Codable, Hashable {
    let id: String?
    let name: String?
}
