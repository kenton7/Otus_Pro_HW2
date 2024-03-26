//
//  EverythingNewsFetcher.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 12.02.2024.
//

import Foundation
import CoreLayerPackage

protocol IEverythingNewsService {
    func getEverythingNews(about: String, page: Int, completion: @escaping (Result<EverythingNewsModel, Error>) -> Void)
    func getHotNews(in country: String, page: Int, completion: @escaping (Result<EverythingNewsModel, Error>) -> Void)
}

class EverythingNewsService: IEverythingNewsService {
    private let client: RestAPIClient
    
    init(client: RestAPIClient = .init() ) {
        self.client = client
    }
    
    func getEverythingNews(about: String, page: Int, completion: @escaping (Result<EverythingNewsModel, Error>) -> Void) {
        client.performRequest(NewsEndpoints.everything(about: about, pageSize: 5, page: page)) { result in
            switch result {
            case .success(let news):
                do {
                    let news = try JSONDecoder().decode(EverythingNewsModel.self, from: news)
                    DispatchQueue.main.async {
                        completion(.success(news))
                    }
                } catch let error {
                    print("error: \(error)")
                    completion(.failure(error))
                }
            case .failure(let error):
                print("can't get everything news: \(error)")
                completion(.failure(error))
            }
        }
    }
    
    func getHotNews(in country: String, page: Int, completion: @escaping (Result<EverythingNewsModel, Error>) -> Void) {
        client.performRequest(NewsEndpoints.topHeadlines(country: country, pageSize: 5, page: page)) { result in
            switch result {
            case .success(let hotNews):
                do {
                    let news = try JSONDecoder().decode(EverythingNewsModel.self, from: hotNews)
                    completion(.success(news))
                } catch let error {
                    print("can't get hot news: \(error)")
                    completion(.failure(error))
                }
            case .failure(let error):
                print("can't get hot news: \(error)")
                completion(.failure(error))
            }
        }
    }
}
