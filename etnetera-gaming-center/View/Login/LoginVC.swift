import Foundation
import UIKit
import LocalAuthentication

class LoginVC: UIViewController {
    
    private lazy var loginButton = makeLoginButton()
    private var inputLoginVM = InputLoginVM()
    
    private func makeLoginButton() -> UIButton {
        let rVal = UIButton()
        rVal.setTitle("Přihlásit", for: .normal)
        rVal.backgroundColor = UIColor(named: "academy")
        rVal.layer.cornerRadius = 6
        rVal.setTitleColor(UIColor.white.withAlphaComponent(0.6), for: .highlighted)
        rVal.addTarget(self, action: #selector(self.press), for: .touchUpInside)
        return rVal
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(loginButton)
        addConstraints()
    }
    
    private func addConstraints() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: loginButton.intrinsicContentSize.width + 2 * 30).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: loginButton.intrinsicContentSize.height + 2 * 10).isActive = true
    }
    
    @objc private func press() {
        if UserDefaults.standard.value(forKey: "username") != nil {
            let authContext = LAContext()
            authContext.localizedFallbackTitle = "Přihlásit se"
            authContext.localizedCancelTitle = "Zrušit"
            
            let reason: String = "Automatické přihlašování"
            
            var authError: NSError?
            if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                    if success {
                        DispatchQueue.main.sync {
                            let loadingVC = UIViewController()
                            let loadingIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
                            loadingIndicator.startAnimating()
                            loadingVC.view.addSubview(loadingIndicator)
                            loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
                            loadingIndicator.centerXAnchor.constraint(equalTo: loadingVC.view.centerXAnchor).isActive = true
                            loadingIndicator.centerYAnchor.constraint(equalTo: loadingVC.view.centerYAnchor).isActive = true
                            self.navigationController?.pushViewController(loadingVC, animated: false)
                        }
                        
                        self.inputLoginVM.login(email: (UserDefaults.standard.value(forKey: "username") as? String)!, password: (UserDefaults.standard.value(forKey: "password") as? String)!) { [weak self] player in
                            if player == nil {
                                self?.navigationController?.popViewController(animated: false)
                            } else {
                                let playerProfileVC = PlayerProfileVC(with: player!)
                                self?.navigationController?.popViewController(animated: false)
                                self?.navigationController?.pushViewController(playerProfileVC, animated: false)
                            }
                        }
                    } else {
                        guard let error = error else { return }
                        print(error)
                        DispatchQueue.main.sync {
                            let inputLoginVC = InputLoginVC()
                            self.navigationController?.pushViewController(inputLoginVC, animated: false)
                        }
                    }
                }
            } else {
                let inputLoginVC = InputLoginVC()
                self.navigationController?.pushViewController(inputLoginVC, animated: false)
            }
        } else {
            let inputLoginVC = InputLoginVC()
            self.navigationController?.pushViewController(inputLoginVC, animated: false)
        }
    }
}

