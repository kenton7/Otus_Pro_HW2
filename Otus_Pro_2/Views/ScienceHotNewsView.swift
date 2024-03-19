//
//  HotNewsView.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 13.02.2024.
//

import SwiftUI

struct ScienceHotNewsView: View {
    
    var hotNews: [Article]?
    let viewModel: EverythingNewsViewModel
    @State private var path = [Article]()
    @State private var isTapped = false
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                List {
                    if let hotNews = hotNews {
                        ForEach(0..<hotNews.count, id: \.self) { i in
                            if i == hotNews.count - 1 {
                                RowView(article: hotNews[i], isLast: true, topic: .science, viewModel: self.viewModel)
                            } else {
                                RowView(article: hotNews[i], isLast: false, topic: .science, viewModel: self.viewModel)
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .navigationDestination(for: Article.self) { content in
                    FirstView(article: content, path: $path)
                }
            .navigationTitle("Наука")
            }
        }
    }
    
    func detailView(_ article: Article) -> DetailView {
        return DetailView(article: article)
    }
}
