//
//  ThirdView.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 13.02.2024.
//

import SwiftUI

struct ThirdView: View {
    
    var text: String
    @Binding var path: [Article]
    
    var body: some View {
        ZStack {
            Color.pink.ignoresSafeArea()
            VStack {
                Spacer()
                Text(text)
                    .font(.system(size: 30, design: .rounded)).foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }
        .navigationTitle("Last View")
    }
}
