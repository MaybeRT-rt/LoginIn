//
//  ToastView.swift
//  LoginIn
//
//  Created by Liz-Mary on 14.11.2024.
//

import UIKit
import SnapKit

final class ToastView: UIView {
    private let messageLabel = UILabel()
    
    init(message: String) {
        super.init(frame: CGRect.zero)
        setupView(message: message)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(message: String) {
        backgroundColor = UIColor.black.withAlphaComponent(0.7)
        layer.cornerRadius = 10
        clipsToBounds = true
        
        messageLabel.text = message
        messageLabel.textColor = .white
        messageLabel.font = .systemFont(ofSize: 16)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        addSubview(messageLabel)
        
        messageLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
        }
    }
    
    func showToast(in view: UIView, duration: TimeInterval = 3.0) {
        view.addSubview(self)
        
        self.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-40)
            make.width.lessThanOrEqualTo(view.snp.width).multipliedBy(0.8)
        }
        
        self.alpha = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 1
        }) { [weak self] _ in
            // Анимация исчезновения после задержки
            UIView.animate(withDuration: 0.3, delay: duration, options: .curveEaseOut, animations: {
                self?.alpha = 0
            }) { _ in
                self?.removeFromSuperview()
            }
        }
    }
}
