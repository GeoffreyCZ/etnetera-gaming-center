import Foundation

public class ScoreDetail: Decodable {
    let value: Int
    let emoji: String
    let name: String
    
    init(value: Int, emoji: String, name: String) {
        self.value = value
        self.emoji = emoji
        self.name = name
    }
}
