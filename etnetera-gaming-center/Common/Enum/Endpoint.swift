import Foundation

enum Endpoint: String {
    case playerList = "/api/participants?sort=asc"
    case login = "/api/login"
    case player = "/api/player"
    case account = "/api/account"
}
