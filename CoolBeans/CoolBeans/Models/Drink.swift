//
//  Drink.swift
//  CoolBeans
//
//  Created by Mohammed Mubashir on 22/03/23.
//

import Foundation

struct Drink : Identifiable, Codable {
    let id: UUID
    let name : String
    let caffeine : [Int]
    let coffeeBased: Bool
    let servedWithMilk: Bool
    let baseCalories: Int
    
    var image:String {
        name.lowercased().replacingOccurrences(of: " ", with: "-")
    }
    
    static let example = Drink(id: UUID(), name: " Coca Cola",caffeine: [100,200,300],coffeeBased: true,servedWithMilk: true,baseCalories: 150)
    
}
