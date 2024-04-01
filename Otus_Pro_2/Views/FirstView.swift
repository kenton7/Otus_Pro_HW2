//
//  FirstView.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 13.02.2024.
//

import SwiftUI

struct FirstView: View {
    
    @EnvironmentObject var viewModel: BaseViewModel.ArticlesViewModel
    var article: Article
    @Binding var path: [Article]
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            VStack {
                Spacer()
                Text(article.title ?? "")
                    .font(.system(size: 30, design: .rounded)).foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                Spacer()
                NavigationLink {
                    SecondView(article: article, path: $path)
                } label: {
                    Text("Далее")
                        .foregroundStyle(.white)
                        .font(.title)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20, style: .continuous))
                }
            }
        }
        .navigationTitle("First View")
    }
}

//#Preview {
//    FirstView()
//}
