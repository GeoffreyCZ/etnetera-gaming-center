import Foundation

class AccountCredentials: Decodable {
    let accountId: Int
    let accessToken: String
    
    init(accountId: Int, accessToken: String) {
        self.accountId = accountId
        self.accessToken = accessToken
    }
}
