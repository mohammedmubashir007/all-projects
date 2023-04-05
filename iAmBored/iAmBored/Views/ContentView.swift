//
//  ContentView.swift
//  iAmBored
//
//  Created by Mohammed Mubashir on 11/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ActivityViewModel()
  
    var body: some View {
        VStack(alignment: .center,spacing: 10) {
            
            Text("Are you getting bored?")
                .font(.system(size: 25))
            Text("Try this activity:")
            
            if let activity = viewModel.activity.first {
                Text(activity.activity)
                    .font(.title)
                    .padding()
                Text("Type: \(activity.type)")
            } else {
                Text("Loading...")
            }
            
            Button(action: {
                viewModel.fetchActivityData()
            }, label: {
                Text("Get new activity")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            })
            
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
