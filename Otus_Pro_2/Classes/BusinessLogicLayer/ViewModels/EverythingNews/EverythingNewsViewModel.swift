//
//  EverythingNewsViewModel.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 12.02.2024.
//

import Foundation
import SwiftUI

final class EverythingNewsViewModel: ObservableObject {
    @Published var technologyPage = 1
    @Published var sciencePage = 1
    @Published var scienceNews = [Article]()
    @Published var technologyNews = [Article]()
    let everythingNewsService: IEverythingNewsService
    let hotNewsService: IHotNewsService

    init(everythingNewsService: EverythingNewsService = ServiceLocator.shared.getService(),
         hotNewsService: HotNewsService = ServiceLocator.shared.getService() ) {
        self.everythingNewsService = everythingNewsService
        self.hotNewsService = hotNewsService
    }
    
    func getEverythingNews(about: String, page: Int) {
        DispatchQueue.global(qos: .userInteractive).async {
            self.everythingNewsService.getEverythingNews(about: about, page: page) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let news):
                    self.technologyPage += 1
                    //everythingDataSource = EverythingNewsFactory.makeEverythingNewsModel(news)
                    self.technologyNews.append(contentsOf: news.articles!)
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
    
    func getHotNews(in country: String, page: Int) {
        DispatchQueue.global(qos: .userInteractive).async {
            self.everythingNewsService.getHotNews(in: country, page: page) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let hotNews):
                    self.sciencePage += 1
                    self.scienceNews.append(contentsOf: hotNews.articles!)
                    //hotNewsDataSource = EverythingNewsFactory.makeEverythingNewsModel(hotNews)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
