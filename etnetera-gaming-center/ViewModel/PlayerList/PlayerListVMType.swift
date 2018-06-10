public protocol PlayerListVMType {
    typealias Section = (header: String?, rows: [Player], footer: String?)
    typealias Model = [Section]
    
    var model: Model { get }
    var didUpdateModel: ((Model) -> Void)? { get set }
    
    func loadContent() -> Void
    func numberOfSections() -> Int
    func numberOfRows(inSection: Int) -> Int
    func modelForSection(_ section: Int) -> Section
    func modelForRow(inSection: Int, atIdx: Int) -> Player
}

public extension PlayerListVMType {
    public func numberOfSections() -> Int {
        return model.count
    }
    
    public func numberOfRows(inSection: Int) -> Int {
        return model[inSection].rows.count
    }
    
    public func modelForSection(_ section: Int) -> PlayerListVMType.Section {
        return model[section]
    }
    
    public func modelForRow(inSection: Int, atIdx: Int) -> Player {
        return model[inSection].rows[atIdx]
    }
}
