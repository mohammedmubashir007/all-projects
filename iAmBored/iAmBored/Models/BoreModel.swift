
import Foundation

struct Activity: Decodable {
    let activity: String
    let type: String
    let participants: Int
    let price: Float
    let link: String
    let key: String
    let accessibility: Float
    
    enum CodingKeys: String, CodingKey {
        case activity
        case type
        case participants
        case price
        case link
        case key
        case accessibility
    }
}
