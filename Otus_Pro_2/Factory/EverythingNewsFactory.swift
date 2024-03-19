//
//  EverythingNewsFactory.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 12.02.2024.
//

import Foundation

final class EverythingNewsFactory {
    class func makeEverythingNewsModel(_ model: EverythingNewsProtocol) -> EverythingNewsModel {
        return EverythingNewsModel(status: model.status, totalResults: model.totalResults, articles: model.articles)
    }
}
