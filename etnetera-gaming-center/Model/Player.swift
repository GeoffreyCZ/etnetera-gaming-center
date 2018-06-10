import Foundation

public class Player: Decodable {
    public var id: Int
    public var name: String
    public var imageUrl: String?
    public var scores: [Score]
    
    init(id: Int, name: String, imageUrl: String, scores: [Score]) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.scores = scores
    }
    
    func getTopScores() -> [Score] {
        let descSortedScores = scores.sorted {
            $0.value > $1.value
        }
        return Array(descSortedScores.prefix(Config.maxNumberOfScores))
    }
}

