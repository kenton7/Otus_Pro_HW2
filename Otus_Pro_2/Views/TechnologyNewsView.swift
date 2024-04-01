//
//  AppleNewsView.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 12.02.2024.
//

import SwiftUI

struct TechnologyNewsView: View {
    @State private var path = [Article]()
    @EnvironmentObject var articles: BaseViewModel.ArticlesViewModel
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(articles.technologyNews, id: \.self) { article in
                    RowView(article: article)
                }
            }
            .listStyle(.plain)
            .navigationDestination(for: Article.self) { value in
                FirstView(article: value, path: $path)
            }
            .navigationTitle("Технологии")
        }
    }
}


