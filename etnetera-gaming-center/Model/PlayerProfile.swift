import Foundation

public class PlayerProfile: Decodable {
    let id: Int
    let name: String
    let imageUrl: String?
    let position: String
    let scores: [ScoreDetail]
    
    init(id: Int, name: String, imageUrl: String, position: String, scores: [ScoreDetail]) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.position = position
        self.scores = scores
    }
}
