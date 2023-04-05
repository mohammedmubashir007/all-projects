
// API Endpoint : https://api.spaceflightnewsapi.net/v3/articles

import Foundation

struct SpaceData : Codable , Identifiable {
    
    var id : Int
    var title : String
    var url : String
    var imageUrl : String
    var newsSite : String
    var summary : String
    var publishedAt : String

}
