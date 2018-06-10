import Foundation

class InputLoginVM {
    private let dataProvider = RemoteDataProvider()
    
    func login(email: String, password: String, completion: @escaping (PlayerProfile?) -> Void) {
        dataProvider.login(email: email, password: password) { [weak self] credentials in
            if credentials == nil {
                completion(nil)
            } else {
                self?.dataProvider.loadPlayerProfile(id: (credentials?.accountId)!, token: (credentials?.accessToken)!) { player in
                    completion(player)
                }
            }
        }
    }
}
