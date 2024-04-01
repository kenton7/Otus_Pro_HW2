//
//  ContentView.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 12.02.2024.
//

import SwiftUI

struct ContentView: View {

    @State private var tabSelectedValue = 0
    @EnvironmentObject var articlesViewModel: BaseViewModel.ArticlesViewModel
    
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
                    TechnologyNewsView().tag(0)
                    ScienceHotNewsView().tag(1)
                }.tabViewStyle(.page(indexDisplayMode: .never))
            }
            .animation(.easeIn, value: tabSelectedValue)
        }
        .onAppear {
            articlesViewModel.getTechnologyNews()
            articlesViewModel.getScienceNews()
        }
    }
}

#Preview {
    ContentView()
}
