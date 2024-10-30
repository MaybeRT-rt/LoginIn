//
//  LoginManagerProtocol.swift
//  LoginIn
//
//  Created by Liz-Mary on 15.10.2024.
//

protocol UserDefaultsLoginManagerProtocol {
    func saveLogin(_ login: UserModel, rememberMe: Bool)
    func loadUser() -> UserModel?
    func isRememberMe() -> Bool
}
