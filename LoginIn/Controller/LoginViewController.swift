//
//  ViewController.swift
//  LoginIn
//
//  Created by Liz-Mary on 10.10.2024.
//

import UIKit
import SnapKit


class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview() // Занимаем весь экран
        }
    }
}

