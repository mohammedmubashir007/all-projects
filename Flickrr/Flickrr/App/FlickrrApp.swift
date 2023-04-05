//
//  FlickrrApp.swift
//  Flickrr
//
//  Created by Mohammed Mubashir on 21/03/23.
//

import SwiftUI

@main
struct FlickrrApp: App {
    
    @StateObject var locations = Locations()
    var body: some Scene {
        WindowGroup {
            TabView{
                NavigationView {
                    ContentView(location: locations.primary)
                }
                .tabItem {
                    Image(systemName: "airplane.circle.fill")
                    Text("Discover")
                }
                NavigationView {
                    WorldView()
                }.tabItem {
                    Image(systemName: "star.fill")
                    Text("Locations")
                }
                NavigationView {
                    TipsView()
                }.tabItem {
                    Image(systemName:"list.bullet")
                    Text("Tips")
                }
            }
            .environmentObject(locations)
        }
    }
}
