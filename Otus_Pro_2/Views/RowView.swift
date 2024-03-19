//
//  RowView.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 18.03.2024.
//

import SwiftUI

struct RowView: View {
    
    var article: Article
    var isLast: Bool
    var topic: Topics
    @ObservedObject var viewModel: EverythingNewsViewModel
    
    var body: some View {
        VStack {
            NavigationLink(value: article) {
                VStack {
                    AsyncImage(url: URL(string: article.urlToImage ?? "")) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 500)
                            .padding(.horizontal, -40)
                            .padding(.top, -10)
                            .transition(.scale.animation(.spring(response: 0.5, dampingFraction: 0.55)))
                    } placeholder: {
                        ProgressView()
                    }
                    Text(article.title ?? "")
                        .font(.system(size: 25, design: .rounded))
                        .lineLimit(6)
                        .padding()
                    
                    if self.isLast {
                        Text(article.description ?? "")
                            .font(.system(.subheadline, design: .rounded))
                            .onAppear {
                                if self.topic == .technology {
                                    print("TECHNOLOGY PAGE: \(viewModel.technologyPage)")
                                    self.viewModel.getEverythingNews(about: "technology", page: viewModel.technologyPage)
                                } else {
                                    print("SCIENCE PAGE: \(viewModel.sciencePage)")
                                    self.viewModel.getHotNews(in: "US", page: viewModel.sciencePage)
                                }
                            }
                    } else {
                        Text(article.description ?? "")
                            .font(.system(.subheadline, design: .rounded))
                    }
                    Spacer()
                        .frame(height: 50)
                }
            }
        }
    }
}
