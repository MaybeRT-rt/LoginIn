//
//  ViewController.swift
//  LoginIn
//
//  Created by Liz-Mary on 10.10.2024.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    // MARK: - Public Properties
    weak var coordinator: AppCoordinator?
    
    // MARK: - Private Properties
    private let loginView = LoginView()
    private var loginManager: UserDefaultsLoginManagerProtocol = UserDefaultsLoginManager()
    private var keyboardManager: KeyboardManager?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadDataUser()
        keyboardManagerSetup()
        
        if loginView.userNameField.text?.isEmpty == false {
            loginView.userNameField.showFloatingLabel()
        }
    }
    
    // MARK: - Private Methods
    // Функция для настройки UI
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview() // Занимаем весь экран
        }
        
        loginView.loginButton.addTarget(self, action: #selector (loginButtonTapped), for: .touchUpInside)
    }
    
    private func loadDataUser() {
        if loginManager.isRememberMe(),
            let user = loginManager.loadUser() {
            
            loginView.userNameField.text = user.login
            loginView.switchButton.isOn = true
        }
    }
    
    private func keyboardManagerSetup() {
        keyboardManager = KeyboardManager(view: view)
    }
    
    private func displayToastAlert(privateMessage: String) {
        let toast = ToastView(message: privateMessage)
        toast.showToast(in: self.view)
    }
    
    // MARK: - Actions
    @objc func loginButtonTapped() {
        guard let login = loginView.userNameField.text, !login.isEmpty, let passwordField = loginView.passwordField.text, !passwordField.isEmpty else {
            displayToastAlert(privateMessage: "Login or password empty")
            return
        }
        
        if login == loginView.userNameField.text {
            coordinator?.goToTaskScreen()
        }
    }
    
    @objc func registerButtonTapped() {
        
    }
}

