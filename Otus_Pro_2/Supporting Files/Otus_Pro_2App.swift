//
//  Otus_Pro_2App.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 12.02.2024.
//

import SwiftUI

@main
struct Otus_Pro_2App: App {
    
    @StateObject var viewModel = BaseViewModel.ArticlesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
