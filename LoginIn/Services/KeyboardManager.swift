//
//  KeyboardManager.swift
//  LoginIn
//
//  Created by Liz-Mary on 30.10.2024.
//

import UIKit

final class KeyboardManager {
    
    private weak var view: UIView?
    
    init(view: UIView) {
        self.view = view
        setupKeyboardObservers()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc func keyboardDidShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let view = view else { return }
        UIView.animate(withDuration: 0.3) {
            self.view?.frame.origin.y = -keyboardFrame.height / 3
        }
    }
    
    @objc func keyboardDidHide() {
        UIView.animate(withDuration: 0.3) {
            self.view?.frame.origin.y = 0
        }
    }
}
