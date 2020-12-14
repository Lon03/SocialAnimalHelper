//
//  RegistrationController.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 12/1/19.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import UIKit
import Validator
import SwiftEntryKit
import NVActivityIndicatorView

extension RegistrationController: RegistrationViewInterface {
    func reloadProfile() {

    }

    func activityIndicatorChange(_ state: Bool) {
        if state {
            self.activityIndicatorView.startAnimating()
        } else {
            self.activityIndicatorView.stopAnimating()
        }
    }
    
    func initSaveButtonState(state: Bool) {
        if state {
            self.saveBtn.isEnabled = true
            self.saveBtn.backgroundColor = .primary()
        } else {
            self.saveBtn.isEnabled = false
            self.saveBtn.backgroundColor = .enabled()
        }
    }
}


class RegistrationController: UIViewControllerCustom, Navigatable, NVActivityIndicatorViewable {
    
    private let tableIdentifies:[String] = [
        LoginTextFieldsCell.reuseIdentifier
    ]
    
    private var presenter: RegistrationPresenter?
    
    var navigator: Navigator!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var saveBtn: RootButton!
    
    @IBOutlet weak var tableView: UITableView! {
        willSet {
            newValue.delegate = self
            newValue.dataSource = self
            newValue.separatorStyle = .none
            newValue.showsVerticalScrollIndicator = false
            newValue.backgroundColor = .white
            for nibName in self.tableIdentifies {
                newValue.register(UINib(nibName: nibName, bundle: .main), forCellReuseIdentifier: nibName)
            }
        }
    }
    
    convenience init(navigator: Navigator) {
        self.init()
        self.navigator = navigator
    }
    
    // MARK: Public methods

    func setPresenter(_ presenter: PresenterType) {
        self.presenter = presenter as? RegistrationPresenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeUI()
    }

    private func makeUI() {
        self.titleLabel.textColor = .primary()
        self.initSaveButtonState(state: false)
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.navigator.dismiss(sender: self)
    }
        
    @IBAction func saveBtn(_ sender: UIButton) {
        guard let presenter = presenter else { return }
        presenter.register()
    }
}

extension RegistrationController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presenter = presenter else { return 0 }
        return presenter.getData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = UITableViewCell()
        guard let presenter = presenter else { return cell }
        let data = presenter.getData()[indexPath.row]
        let stringCell = tableView.dequeueReusableCell(withIdentifier: LoginTextFieldsCell.reuseIdentifier, for: indexPath) as! LoginTextFieldsCell
        stringCell.delegate = self
        stringCell.selectionStyle = .none
        switch data {
        case let .nickname(title):
            stringCell.bind(type: .nickname(title: title))
            stringCell.validationRuleSet = ValidationRuleSet<String>()
            stringCell.titleLabel.text = title
            let minLengthRule = ValidationRuleLength(min: 5, error: ExampleValidationError("Ошибка"))
            stringCell.validationRuleSet?.add(rule: minLengthRule)
            cell = stringCell
            return cell
        case .email(let title):
            stringCell.bind(type: .email(title: title))
            stringCell.validationRuleSet = ValidationRuleSet<String>()
            stringCell.titleLabel.text = title
            let emailRule = ValidationRulePattern(pattern: EmailValidationPattern.standard, error: ExampleValidationError("Ошибка"))
            stringCell.validationRuleSet?.add(rule: emailRule)
            cell = stringCell
            return cell
        case .phone(let title):
            stringCell.bind(type: .phone(title: title))
            stringCell.validationRuleSet = ValidationRuleSet<String>()
            stringCell.titleLabel.text = title
            let minLengthRule = ValidationRuleLength(min: 5, error: ExampleValidationError("Ошибка"))
            stringCell.validationRuleSet?.add(rule: minLengthRule)
            cell = stringCell
            return cell
        case .password(let title):
            stringCell.bind(type: .password(title: title))
            stringCell.validationRuleSet = ValidationRuleSet<String>()
            stringCell.titleLabel.text = title
            let minLengthRule = ValidationRuleLength(min: 5, error: ExampleValidationError("Ошибка"))
            stringCell.validationRuleSet?.add(rule: minLengthRule)
            cell = stringCell
            return cell
        }
    }
}

extension RegistrationController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 78
    }
}

extension RegistrationController: LoginTextFieldsCellDelegate {
    
    func textFieldChange(dataType: RegistrationTypeField, text: String?) {
        guard let presenter = presenter else { return }
        presenter.textFieldChange(dataType: dataType, text: text)
    }
}
