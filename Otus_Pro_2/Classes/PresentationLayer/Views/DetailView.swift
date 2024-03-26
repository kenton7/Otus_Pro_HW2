//
//  DetailView.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 13.02.2024.
//

import SwiftUI

struct DetailView: View {

    var article: Article
    
    var body: some View {
            ScrollView {
                VStack {
                    AsyncImage(url: URL(string: article.urlToImage ?? "")) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 500)
                            .ignoresSafeArea()
                    } placeholder: {
                        ProgressView()
                    }
                    Text(article.content ?? "")
                        .font(.system(size: 30, design: .rounded))
                        .padding(.horizontal)
                }
            }
            .ignoresSafeArea()
    }
}

#Preview {
    DetailView(article: Article(source: .none, author: "dsfdfs", title: "dsfsdf", description: "sdfsdfsdf", url: "dsfsf", urlToImage: "https://scitechdaily.com/images/Perseverance-Spots-Ingenuity-at-Its-Final-Airfield-Crop-scaled.jpg", publishedAt: "vdsfsdf", content: "sdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdf"))
}
