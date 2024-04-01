//
//  HotNewsView.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 13.02.2024.
//

import SwiftUI

struct ScienceHotNewsView: View {
    
    @EnvironmentObject var articles: BaseViewModel.ArticlesViewModel
    @State private var path = [Article]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                List {
                    ForEach(articles.scienceNews, id: \.self) { article in
                        RowView(article: article)
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
