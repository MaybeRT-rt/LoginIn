//
//  CustomTextField.swift
//  LoginIn
//
//  Created by Liz-Mary on 14.10.2024.
//

import UIKit
import SnapKit

class FloatingLabelTextField: UITextField {
    // Лейбл, который будет "плавать" над текстовым полем
    private var floatingLabel = UILabel()
    // Высота лейбла и длительность анимации
    private let floatingLabelHeight: CGFloat = 15
    private let animationDuration: TimeInterval = 0.3
    
    private var originalPlaceholder: String?
    // Переопределяем свойство placeholder, чтобы установить его значение в floatingLabel
    override var placeholder: String? {
        didSet {
            originalPlaceholder = placeholder
            floatingLabel.text = placeholder
            
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.darkGray,
                .font: self.font ?? UIFont.systemFont(ofSize: 16) 
            ]
            self.attributedPlaceholder = NSAttributedString(string: originalPlaceholder ?? "", attributes: attributes)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        floatingLabel.alpha = 0
        floatingLabel.font = UIFont.systemFont(ofSize: floatingLabelHeight, weight: .bold).withSize(16)
        floatingLabel.textColor = .darkGray
        floatingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(floatingLabel)
        
        floatingLabel.snp.makeConstraints { make in
            make.leading.equalTo(self).offset(0)
            make.bottom.equalTo(self.snp.top).offset(self.frame.height)
        }
        // Добавляем действия для событий редактирования
        addTarget(self, action: #selector (textFieldDidBeginEditing), for: .editingDidBegin)
        addTarget(self, action: #selector(textFieldDidBeginEnd), for: .editingDidEnd)
        
        
    }
    
    func showFloatingLabel() {
        UIView.animate(withDuration: animationDuration, animations: {
            self.floatingLabel.alpha = 1
            self.floatingLabel.textColor = .black
            self.floatingLabel.snp.updateConstraints { make in
                make.bottom.equalTo(self.snp.top).offset(-5)
            }
            self.layoutIfNeeded()
        })
    }
    
    private func hideFloatingLabel() {
        UIView.animate(withDuration: animationDuration, animations: {
            self.floatingLabel.alpha = 0
            self.floatingLabel.snp.updateConstraints { make in
                make.bottom.equalTo(self.snp.top).offset(self.frame.height) // Возвращаем лейбл на место
            }
            self.layoutIfNeeded()
        })
    }
    
    // текстовое поле активируется при редактировании
    @objc private func textFieldDidBeginEditing() {
        guard let text = text, text.isEmpty else { return }
        // Показать лейбл при начале редактирования
        showFloatingLabel()
        // Устанавливаем пустой атрибутированный плейсхолдер
       self.attributedPlaceholder = NSAttributedString(string: "")
    }
    
    // текстовое поле деактивируется после ред.
    @objc private func textFieldDidBeginEnd() {
        guard let text = text, text.isEmpty else { return }
        hideFloatingLabel()
        // Возвращаем плейсхолдер
        self.attributedPlaceholder = NSAttributedString(string: originalPlaceholder ?? "")
    }
}

