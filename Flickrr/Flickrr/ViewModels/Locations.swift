//
//  Locations.swift
//  Flickrr
//
//  Created by Mohammed Mubashir on 22/03/23.
//

import Foundation

class Locations : ObservableObject {
    
    var places : [Location]
    
    var primary : Location{
        places[0]
    }
    
    init(){
        let url = Bundle.main.url(forResource: "locations", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        places = try! JSONDecoder().decode([Location].self, from: data)
        
    }
}
