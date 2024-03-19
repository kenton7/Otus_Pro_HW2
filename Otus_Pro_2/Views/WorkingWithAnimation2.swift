import SwiftUI
import Combine

struct WorkingWithAnimation2: View {
    @State private var items = ["Item 1", "Item 2", "Item 3"]
    @State private var isPressed = Array(repeating: false, count: 3)
    @State private var someString: String? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(items.indices, id: \.self) { item in
                        Button(action: {
                            withAnimation {
                                isPressed[item].toggle()
                            }
                            someString = items[item]
                            
                        }, label: {
                            ZStack {
                                Text(items[item])
                                    .foregroundStyle(.black)
                                    .frame(height: 40)
                                HStack {
                                    Text(items[item] + " copy").tag(items[item])
                                }
                                //.frame(maxWidth: .infinity)
                                .background(isPressed[item] ? .white : .blue)
                                .foregroundStyle(.black)
                                .offset(y: isPressed[item] ? 200 : 0)
                                .opacity(isPressed[item] ? 0 : 1)
                                .animation(.easeInOut(duration: 3), value: isPressed[item])
                            }
                        })
                        .tag(item)
                    }
                }
                .navigationDestination(item: $someString) { content in
                    SomeView(text: content)
                }
            }
        }
    }
}

struct SomeView: View {
    
    let text: String
    
    var body: some View {
        VStack {
            Text(text)
        }
    }
}

struct NewView: View {
    let text: String
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text(text)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithAnimation2()
    }
}





