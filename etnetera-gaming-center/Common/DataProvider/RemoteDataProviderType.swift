import Foundation

protocol RemoteDataProviderType: DataProviderType {
    func getUrl(for endpoint: Endpoint) -> URL
}

extension RemoteDataProviderType {
    func getUrl(for endpoint: Endpoint) -> URL {
        return URL(string: Config.baseUrl + endpoint.rawValue)!
    }
    
    func getUrl(for endpoint: Endpoint, with id: Int) -> URL {
        return URL(string: Config.baseUrl + endpoint.rawValue + "/" + String(id))!
    }
}
