import Foundation

protocol DataProviderType {
    func loadPlayerList(completion: @escaping (_ playerList: [Player]?) -> Void)
    func login(email: String, password: String, completion: @escaping (_ accountCredentials: AccountCredentials?) -> Void)
    func loadPlayer(id: Int, completion: @escaping (_ person: PlayerProfile?) -> Void)
}
