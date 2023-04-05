//
//  Servings.swift
//  CoolBeans
//
//  Created by Mohammed Mubashir on 23/03/23.
//

import Foundation

struct Servings : Codable, Identifiable, Equatable {
    var id : UUID
    let name : String
    let description : String
    let caffeine: Int
    let calories : Int
}
