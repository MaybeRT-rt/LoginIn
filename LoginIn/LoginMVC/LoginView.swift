//
//  LoginView.swift
//  LoginIn
//
//  Created by Liz-Mary on 10.10.2024.
//

import UIKit
import SnapKit

/*
 ставим перключатель на ремембер ми и сохраняем логин, при следующем заходе меняем текст на Welcome, username, \nplease enter password
 сделать так что бы поднималось все вверх, при открытие клавиатуры(посмотреть в проекте от нетологии там где есть логин!
 */

// MARK: - LoginView
class LoginView: UIView {
    
    // MARK: - Visual Components
    let label: UILabel = {
        let label = UILabel()
        label.text = "Welcome,\nplease login"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userNameField: FloatingLabelTextField = {
        let textField = FloatingLabelTextField()
        textField.placeholder = "Username"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordField: FloatingLabelTextField = {
        let passwordField = FloatingLabelTextField()
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        return passwordField
    }()
    
    let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Let's go", for: .normal)
        loginButton.backgroundColor = .black
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 20
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()
    
    let registerButton: UIButton = {
        let registerButton = UIButton()
        registerButton.setTitle("Register", for: .normal)
        registerButton.backgroundColor = .black.withAlphaComponent(0.7)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = 20
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        return registerButton
    }()
    
    let labelSwith: UILabel = {
        let label = UILabel()
        label.text = "Remember me"
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let switchButton: UISwitch = {
        let switchButton = UISwitch()
        switchButton.onTintColor = .black
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        return switchButton
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let registerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let stackViewSwitch: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    private func setupUI() {
        addSubview(label)
        addSubview(stackView)
        stackView.addArrangedSubview(userNameField)
        stackView.addArrangedSubview(passwordField)
        stackView.addArrangedSubview(registerStackView)
        registerStackView.addArrangedSubview(loginButton)
        registerStackView.addArrangedSubview(registerButton)
        stackView.addArrangedSubview(stackViewSwitch)
        stackViewSwitch.addArrangedSubview(labelSwith)
        stackViewSwitch.addArrangedSubview(switchButton)
        
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.leading.equalToSuperview().inset(20)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(300)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        userNameField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        passwordField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        
        registerButton.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
    }
}
