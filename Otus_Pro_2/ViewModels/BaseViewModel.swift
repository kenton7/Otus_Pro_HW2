//
//  EverythingNewsViewModel.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 12.02.2024.
//

import Foundation
import SwiftUI
import Combine
import NetworkPackage

final class BaseViewModel {
    
    private(set) var cancellableSet: Set<AnyCancellable> = []
    
    final class ArticlesViewModel: ObservableObject {
        @Published var technologyNews = [Article]()
        @Published var scienceNews = [Article]()
        private var viewModel: BaseViewModel
        
        init(viewModel: BaseViewModel = BaseViewModel() ) {
            self.viewModel = viewModel
        }
        
        func getTechnologyNews() {
            NetworkApi.shared.fetchArticles(from: Endpoint(index: 0)!)
                .assign(to: \.technologyNews, on: self)
                .store(in: &self.viewModel.cancellableSet)
        }
        
        func getScienceNews() {
            NetworkApi.shared.fetchArticles(from: Endpoint(index: 1)!)
                .assign(to: \.scienceNews, on: self)
                .store(in: &self.viewModel.cancellableSet)
        }
    }
}
