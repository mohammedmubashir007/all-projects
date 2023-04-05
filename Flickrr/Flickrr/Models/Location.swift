//
//  Location.swift
//  Flickrr
//
//  Created by Mohammed Mubashir on 22/03/23.
//

import Foundation

struct Location: Decodable, Identifiable{
    let id : Int
    let name :String
    let country : String
    let description : String
    let more :String
    let latitude : Double
    let longitude : Double
    let heroPicture : String
    let advisory : String
    
    
    static let example = Location(id: 1, name: "Great Smoky Mountains", country: "United States", description: "A Great place to visit", more: "More text here", latitude: 1.33, longitude: 34.34, heroPicture: "smokies", advisory: "Beware of bears")
}
