//
//  ContentView.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 12.02.2024.
//

import SwiftUI

struct ContentView: View {

    @State private var tabSelectedValue = 0
    @ObservedObject private var everythingNewsViewModel = EverythingNewsViewModel()
    @State private var path = [Article]()
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker(selection: $tabSelectedValue, label: Text("")) {
                    Text("Новости о технологиях").tag(0)
                    Text("Новости о науке").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                TabView(selection: $tabSelectedValue) {
                    TechnologyNewsView(news: everythingNewsViewModel.technologyNews, viewModel: everythingNewsViewModel).tag(0)
                    ScienceHotNewsView(hotNews: everythingNewsViewModel.scienceNews, viewModel: everythingNewsViewModel).tag(1)
                }.tabViewStyle(.page(indexDisplayMode: .never))
            }
            .animation(.easeIn, value: tabSelectedValue)
        }
        .onAppear {
            print("TECHNOLOGY PAGE: \(everythingNewsViewModel.technologyPage)")
            everythingNewsViewModel.getEverythingNews(about: "technology", page: everythingNewsViewModel.technologyPage)
            print("SCIENCE PAGE: \(everythingNewsViewModel.sciencePage)")
            everythingNewsViewModel.getHotNews(in: "us", page: everythingNewsViewModel.sciencePage)
        }
    }
}

#Preview {
    ContentView()
}
