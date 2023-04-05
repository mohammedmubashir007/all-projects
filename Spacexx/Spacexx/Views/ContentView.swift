//
//  ContentView.swift
//  Spacexx
//
//  Created by Mohammed Mubashir on 29/03/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data  = SpaceAPI()
    @State private var opaque = 0.0
    
    var body: some View {
        NavigationView {
            VStack {
                NewsView()
                    .opacity(opaque)
            }
            .navigationTitle("Spacexx")
            .environmentObject(data)
            .onAppear{
                data.getData()
                withAnimation(.easeIn(duration: 2)){
                    opaque = 1.0
                }
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .
//    }
//}
