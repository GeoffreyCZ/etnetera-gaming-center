import Foundation

public class PlayerListVM: PlayerListVMType {
    private let dataProvider: DataProviderType
    
    init() {
        self.dataProvider = RemoteDataProvider()
    }
    
    public var model: [PlayerListVMType.Section] = [] {
        didSet {
            didUpdateModel?(model)
        }
    }
    
    public var didUpdateModel: ((Model) -> Void)?
    
    public func loadContent() {
        dataProvider.loadPlayerList { [weak self] playerList in
            let players = playerList!.map {
                $0
            }
            self?.model = [Section(header: nil, rows: players, footer: nil)]
        }
    }
}
