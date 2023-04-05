//
//  Mission.swift
//  MoonShot
//
//  Created by Mohammed Mubashir on 03/04/23.
//

import Foundation

struct Mission : Codable, Identifiable {
    let id: Int
    let description : String
    let crew : [CrewRole]
    let launchDate : Date?
    
    struct CrewRole : Codable{
        let name: String
        let role : String
    }
    var displayName : String {
        "Apollo \(id)"
    }
    
    var image : String{
        "apollo\(id)"
    }
    
    var formattedLaunchDate : String{
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
}

