//
//  Something.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 19.03.2024.
//

import SwiftUI

struct WorkingWithAnimation: View {
    
    @State private var items = ["1", "2", "3"]
    @State private var someString: String? = nil
    @State private var isPressed = Array(repeating: false, count: 3)
    
    var body: some View {
        NavigationStack {
            List(items.indices, id: \.self) { item in
                Button(action: {
                    //someString = item
                    withAnimation(.default) {
                        isPressed[item].toggle()
                    }
                    //isPressed[item].toggle()
                    print(items[item])
                    //items.removeAll(where: { $0 == item })
                    
                }, label: {
                    ZStack {
                        Text(items[item])
                            .foregroundStyle(.black)
                        ViewCopy(text: items[item])
                            //.frame(maxWidth: .infinity)
                            //.opacity(isPressed[item] ? 1 : 0)
                            .offset(x: isPressed[item] ? -40 : 0)
                            //.animation(.easeIn, value: isPressed)
                        
                    }
                })
            }
//            .navigationDestination(item: $someString) { content in
//                Text(content)
//            }
        }
    }
}

struct ViewCopy: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .foregroundStyle(.black)
            .background(Color.green)
    }
}

#Preview {
    WorkingWithAnimation()
}

