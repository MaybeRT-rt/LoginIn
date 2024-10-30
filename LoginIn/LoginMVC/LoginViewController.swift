//
//  ViewController.swift
//  LoginIn
//
//  Created by Liz-Mary on 10.10.2024.
//

import UIKit
import SnapKit


final class LoginViewController: UIViewController {
    
    weak var coordinator: AppCoordinator?
    
    let loginView = LoginView()
    private var loginManager: UserDefaultsLoginManagerProtocol = UserDefaultsLoginManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadDataUser()
    }
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
    
    @objc func loginButtonTapped() {
        guard let login = loginView.userNameField.text, !login.isEmpty else {
            print("Login is empty")
            return
        }
//        
//        let rememberMe = loginView.switchButton.isOn
//        let user = UserModel(login: login)
//        loginManager.saveLogin(user, rememberMe: rememberMe)
//        
//        print("Login: \(login) saved")
        
        if login == loginView.userNameField.text {
            coordinator?.goToTaskScreen()
        }
    }
}

