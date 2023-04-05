import SwiftUI

struct ContentView: View {
    @State var name = Array("Mohammed Mubashir")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<name.count,id:\.self){
                num in
                Text(String(name[num]))
                    .font(.title)
                    .background(enabled ? .blue:.red)
                    .offset(dragAmount)
                    .animation(.default.delay(Double(num)/20), value: dragAmount)
            }
        }
        .gesture(
        DragGesture()
            .onChanged{dragAmount = $0.translation}
            .onEnded({ _ in
                dragAmount = .zero
                enabled.toggle()
            })
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
