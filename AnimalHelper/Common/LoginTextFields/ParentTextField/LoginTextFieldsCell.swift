//
//  LoginTextFieldsCell.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 12/1/19.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import UIKit
import Validator

protocol LoginTextFieldsCellDelegate {
    func textFieldChange(dataType: RegistrationTypeField, text: String?)
}

class LoginTextFieldsCell: UITableViewCell, NameDescribable, UITextFieldDelegate {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var stateLabel: UILabel!

    private var dataType: RegistrationTypeField?
    
    var delegate: LoginTextFieldsCellDelegate?
    
    var validationRuleSet: ValidationRuleSet<String>? {
        
        didSet {
            self.textField.validationRules = validationRuleSet
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        self.textField.delegate = self
        textField.validateOnInputChange(enabled: true)
        textField.validationHandler = { result in self.updateValidationState(result: result) }
        self.makeUI()
        stateLabel.text = ""
    }
    
    func makeUI() {
        self.stateLabel.textColor = .red
        self.textField.textColor = .black
    }
    
    func bind(type: RegistrationTypeField) {
        self.dataType = type
        var titleString: String?
        switch type {
        case .nickname(let title):
            titleString = title
            self.initNameTextField()
        case .email(let title):
            titleString = title
            self.initEmailTextField()
        case .phone(let title):
            titleString = title
            self.initNamePhoneField()
        case .password(let title):
            titleString = title
            self.initPasswordTextField()
        }
        self.titleLabel.text = titleString
    }
    
    
    func initPasswordTextField() {
        self.textField.autocapitalizationType = .none
        self.textField.autocorrectionType = .no
        self.textField.keyboardType = .asciiCapable
        self.textField.isSecureTextEntry = true
        self.textField.returnKeyType = .go
        self.textField.enablesReturnKeyAutomatically = true
        if #available(iOS 11.0, *) {
            self.textField.textContentType = .password
        }
        self.textField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initEmailTextField() {
        self.textField.autocapitalizationType = .none
        self.textField.keyboardType = .asciiCapable
        self.textField.textContentType = .emailAddress
        self.textField.returnKeyType = .next
        self.textField.enablesReturnKeyAutomatically = true
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func initNameTextField() {
        self.textField.textContentType = .nickname
        self.textField.returnKeyType = .next
        self.textField.enablesReturnKeyAutomatically = true
        self.textField.keyboardType = .asciiCapable
    }
    
    func initNamePhoneField() {
        self.textField.textContentType = .telephoneNumber
        self.textField.returnKeyType = .next
        self.textField.enablesReturnKeyAutomatically = true
        self.textField.keyboardType = .phonePad
    }
    
    func updateValidationState(result: ValidationResult) {
        
        switch result {
            
        case .valid:
            stateLabel.text = ""
            break
            
        case .invalid(let failures):
            stateLabel.text = failures.map { $0.message }.joined()
            break
        }
    }
    
    override func prepareForReuse() {
        
        textField.text = ""
    }
    
    // MARK: - UITextFieldDelegate
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let type = self.dataType else {
            return
        }
        guard let text: String = textField.text else {
            return
        }
        if case RegistrationTypeField.nickname = type {
            DispatchQueue.main.async {
                self.textField.text = text.replacingOccurrences(of: " ", with: "_", options: NSString.CompareOptions.literal, range: nil)   .lowercased().filter { !"-/:;()$&@[]{}#%^*+=~<>€£¥•.,?!'\\\"|".contains($0) }
            }
        }
        
        guard textField.validate().isValid else {
            delegate?.textFieldChange(dataType: type, text: nil)
            return
        }
        delegate?.textFieldChange(dataType: type, text: text)

    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {

    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

    }
}
