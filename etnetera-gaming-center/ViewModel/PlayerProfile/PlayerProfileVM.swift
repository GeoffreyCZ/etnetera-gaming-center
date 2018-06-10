import Foundation

class PlayerProfileVM {
    var content: PlayerProfile?
    
    private let dataProvider = RemoteDataProvider()
    
    func loadPlayerProfile(for id: Int, completion: @escaping (PlayerProfile?) -> Void) {
        dataProvider.loadPlayer(id: id) { player in
            completion(player)
        }
    }
    
}























