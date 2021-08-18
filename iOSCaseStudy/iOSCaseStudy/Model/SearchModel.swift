
//  Created by rails on 17/08/21.
//
import Foundation

struct SearchResponse: Codable {
    let webs: [WebData]
    
    enum CodingKeys: String, CodingKey {
        case webs = "results"
    }
}
    
struct WebData: Codable {
    var trackId: Int
    var trackName, artistName, artworkUrl60 :String
    
    enum CodingKeys: String, CodingKey {
        case trackId = "trackId"
        case trackName,artistName,artworkUrl60
    }
}

