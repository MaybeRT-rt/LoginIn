//
//  LoginManager.swift
//  LoginIn
//
//  Created by Liz-Mary on 15.10.2024.
//

import Foundation

final class UserDefaultsLoginManager {
    
    private let storage: UserDefaults = .standard
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    enum Keys {
        static let loginKey = "username"
        static let rememberMeKey = "rememberMe"
    }
}

extension UserDefaultsLoginManager: UserDefaultsLoginManagerProtocol {
    
    func saveLogin(_ login: UserModel, rememberMe: Bool) {
        
        if let encodedLogin = try? encoder.encode(login) {
            storage.set(encodedLogin, forKey: Keys.loginKey)
            storage.set(rememberMe, forKey: Keys.rememberMeKey)
        }
    }
    
    func loadUser() -> UserModel? {
        
        guard let savedLoginData = storage.data(forKey: Keys.loginKey) else { return nil }
        // Декодируем Data обратно в UserModel
        if let user = try? decoder.decode(UserModel.self, from: savedLoginData) {
            return user
        }
        return nil
    }
    
    func isRememberMe() -> Bool {
        return storage.bool(forKey: Keys.rememberMeKey)
    }
}
