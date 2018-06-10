import Foundation

class RemoteDataProvider: RemoteDataProviderType {
    
    func loadPlayer(id: Int, completion: @escaping (PlayerProfile?) -> Void) {
        let url = getUrl(for: .player, with: id)
        
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            let player = try? decoder.decode(PlayerProfile.self, from: data!)
            DispatchQueue.main.sync {
                completion(player)
            }
        }
        session.resume()
    }
    
    func loadPlayerProfile(id: Int, token: String, completion: @escaping (PlayerProfile?) -> Void) {
        let url = getUrl(for: .account, with: id)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue(token, forHTTPHeaderField: "AccessToken")
        
        let session = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            let decoder = JSONDecoder()
            let player = try? decoder.decode(PlayerProfile.self, from: data!)
            DispatchQueue.main.sync {
                completion(player)
            }
        }
        session.resume()
    }
    
    func login(email: String, password: String, completion: @escaping (AccountCredentials?) -> Void) {
        let url = getUrl(for: .login)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let login = Login(email, password)
        let encoder = JSONEncoder()
        let data = try? encoder.encode(login)
        
        urlRequest.httpBody = data
        
        let session = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            let decoder = JSONDecoder()
            let accountCredentials = try? decoder.decode(AccountCredentials.self, from: data!)
            DispatchQueue.main.sync {
                completion(accountCredentials)
            }
        }
        session.resume()
    }
    
    func loadPlayerList(completion: @escaping (_ playerList: [Player]?) -> Void) {
        let url = getUrl(for: .playerList)
        
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            let playerList = try? decoder.decode([Player].self, from: data!)
            DispatchQueue.main.sync {
                completion(playerList)
            }
        }
        session.resume()
    }
    
    
}
