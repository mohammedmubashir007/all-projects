//
//  Menu.swift
//  CoolBeans
//
//  Created by Mohammed Mubashir on 22/03/23.
//

import Foundation

class Menu: ObservableObject, Codable {
    
    var sections : [MenuSection] = []
    var milkOptions = [ConfigurationOptions.none]
    var syrupOptions = [ConfigurationOptions.none]
    
    init(){
        fetchData()
    }
    
    
    func fetchData(){
        
        do{
            let url = Bundle.main.url(forResource: "menu", withExtension: ".json")!
            let data = try! Data(contentsOf: url)
            let menuData = try JSONDecoder().decode(Menu.self, from: data)
            sections = menuData.sections
            milkOptions.append(contentsOf: menuData.milkOptions)
            syrupOptions.append(contentsOf: menuData.syrupOptions)
            
            
        } catch{
            fatalError("Menu.json is corrupt or missing")
        }
    }
    
}
