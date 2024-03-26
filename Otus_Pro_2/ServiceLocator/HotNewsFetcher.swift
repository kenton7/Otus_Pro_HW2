//
//  HotNewsFetcher.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 12.02.2024.
//

import Foundation

protocol IHotNewsService {
    func getHotNews(in country: String, page: Int, completion: @escaping (Result<EverythingNewsModel, Error>) -> Void)
}

class HotNewsFetcher: IHotNewsService {
    private let client: RestAPIClient
    
    init(_ client: RestAPIClient) {
        self.client = client
    }
    
    func getHotNews(in country: String, page: Int, completion: @escaping (Result<EverythingNewsModel, Error>) -> Void) {
        client.performRequest(NewsEndpoints.topHeadlines(country: country, pageSize: 5, page: page)) { result in
            switch result {
            case .success(let hotNews):
                do {
                    let news = try JSONDecoder().decode(EverythingNewsModel.self, from: hotNews)
                    completion(.success(news))
                } catch let error {
                    print("error when get hot news: \(error)")
                }
            case .failure(let error):
                print("error when get hot news: \(error)")
                completion(.failure(error))
            }
        }
    }
}
