import UIKit

class PlayerProfileVC: UIViewController {
    private let playerProfileV: PlayerProfileV
    private let playerProfileVM: PlayerProfileVM
    
    init(with content: PlayerProfile) {
        playerProfileV = PlayerProfileV()
        playerProfileV.content = content
        playerProfileVM = PlayerProfileVM()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    init(id: Int) {
        playerProfileV = PlayerProfileV()
        playerProfileVM = PlayerProfileVM()
        super.init(nibName: nil, bundle: nil)
        playerProfileVM.loadPlayerProfile(for: id) { [weak self] content in
            self?.playerProfileV.content = content
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(playerProfileV)
        playerProfileV.frame = view.bounds
        playerProfileV.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .white
    }
}
