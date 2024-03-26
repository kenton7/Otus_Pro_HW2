//
//  AppleNewsView.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 12.02.2024.
//

import SwiftUI

struct TechnologyNewsView: View {
    
    let news: [Article]?
    let viewModel: EverythingNewsViewModel
    @State private var path = [Article]()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                if let news = news {
                    ForEach(0..<news.count, id: \.self) { i in
                        if i == news.count - 1 {
                            RowView(article: news[i], isLast: true, topic: .technology, viewModel: self.viewModel)
                        } else {
                            RowView(article: news[i], isLast: false, topic: .technology, viewModel: self.viewModel)
                        }
                    }
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


