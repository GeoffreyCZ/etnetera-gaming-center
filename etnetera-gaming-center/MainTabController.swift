import UIKit

class MainTabBarController: UITabBarController {
    
    private lazy var playerListView = makePlayerListView()
    private lazy var loginView = makeLoginView()
    
    private func makePlayerListView() -> UINavigationController {
        let rVal = UINavigationController(rootViewController: PlayerListVC(viewModel: PlayerListVM()))
        rVal.tabBarItem = UITabBarItem(title: "Seznam hráčů", image: UIImage(named: "ic-list"), selectedImage: UIImage(named: "ic-list"))
        return rVal
    }
    
    private func makeLoginView() -> UINavigationController {
        let view = UINavigationController(rootViewController: LoginVC())
        view.tabBarItem = UITabBarItem(title: "Účet", image: UIImage(named: "ic-account"), selectedImage: UIImage(named: "ic-account"))
        view.setNavigationBarHidden(true, animated: true)
        return view
    }
    
    override func loadView() {
        super.loadView()
        viewControllers = [playerListView, loginView]
        self.tabBar.tintColor = UIColor(named: "academy")
    }
}
