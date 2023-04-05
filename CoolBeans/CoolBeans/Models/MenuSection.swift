//
//  MenuSection.swift
//  CoolBeans
//
//  Created by Mohammed Mubashir on 22/03/23.
//

import Foundation

struct MenuSection: Identifiable, Codable {
    let id: UUID
    let name : String
    let drinks : [Drink]
    
    
    func matches(for search:String)->[Drink]{
        let trimmed = search.trimmingCharacters(in: .whitespaces)
        if trimmed.isEmpty {return drinks}
        
        return drinks.filter {
            $0.name.localizedCaseInsensitiveContains(trimmed)
        }
    }
}
