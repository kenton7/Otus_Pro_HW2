//
//  SecondView.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 13.02.2024.
//

import SwiftUI

struct SecondView: View {
    
    var article: Article
    @Binding var path: [Article]
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack {
                Spacer()
                Text("Это второй экран")
                    .font(.system(size: 30, design: .rounded)).foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                Spacer()
                NavigationLink {
                    ThirdView(text: "Это последний экран", path: $path)
                } label: {
                    Text("К последнему View")
                        .foregroundStyle(.white)
                        .font(.title)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20, style: .continuous))
                }
            }
            .navigationTitle("Second View")
        }
    }
}
