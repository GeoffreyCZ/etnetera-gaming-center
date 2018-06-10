import Foundation

public class Score: Decodable {
    let value: Int
    let emoji: String
    
    init(value: Int, emoji: String) {
        self.value = value
        self.emoji = emoji
    }
}
