//
//  Tip.swift
//  Flickrr
//
//  Created by Mohammed Mubashir on 22/03/23.
//

import Foundation

struct Tip : Decodable {
    let text : String
    let children : [Tip]?
    
}
