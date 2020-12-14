//
//  SettingsController.swift
//  AnimalHelper
//
//  Created by Mike Martyniuk on 01.12.2019.
//  Copyright © 2019 animalHelper. All rights reserved.
//

import UIKit

extension SettingsController: SettingsViewInterface {
    func reloadProfile() {

    }

    func activityIndicatorChange(_ state: Bool) {
        if state {
            self.activityIndicatorView.startAnimating()
        } else {
            self.activityIndicatorView.stopAnimating()
        }
    }
}


class SettingsController: UIViewControllerCustom, Navigatable {
    
    private let tableIdentifies:[String] = [
        DeviderCell.reuseIdentifier,
        SwitchCell.reuseIdentifier,
        InfoCell.reuseIdentifier,
        ButtonCell.reuseIdentifier
    ]
    
    private var presenter: SettingsPresenter?
    var navigator: Navigator!
    
    @IBOutlet weak var tableView: UITableView! {
        willSet {
            newValue.delegate = self
            newValue.dataSource = self
            newValue.separatorStyle = .none
            for nibName in self.tableIdentifies {
                newValue.register(UINib(nibName: nibName, bundle: .main), forCellReuseIdentifier: nibName)
            }
        }
    }
    
    @IBOutlet weak var userAvatarImg: UIImageView!
    
    @IBOutlet weak var avatarView: UIView!
    
    
    convenience init(navigator: Navigator) {
        self.init()
        self.navigator = navigator
    }
    
    func setPresenter(_ presenter: PresenterType) {
        self.presenter = presenter as? SettingsPresenter
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func makeUI() {
        self.initAvatarUI()
    }
    
    private func initAvatarUI() {
        self.userAvatarImg.clipsToBounds = true
        self.userAvatarImg.layer.cornerRadius = self.userAvatarImg.frame.width / 2
        self.avatarView.clipsToBounds = true
        self.avatarView.layer.cornerRadius = self.avatarView.frame.width / 2
        self.avatarView.layer.borderWidth = 3
        self.avatarView.layer.borderColor = UIColor.primary().cgColor
    }
}


extension SettingsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = self.presenter?.getInfo() else {
            return
        }
        switch data[indexPath.row] {
        case let .info(title):
            break
        case .notifications(let title):
            break
        case .help(let title):
            break
        case .logOut(let title):
            User.removeCurrentUser()
            AuthManager.removeToken()
            Application.shared.presentInitialScreen(in: Application.shared.window)
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension SettingsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = self.presenter?.getInfo() else {
            return 0
        }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        guard let data = self.presenter?.getInfo() else {
            return cell
        }
        switch data[indexPath.row] {
        case let .info(title):
            let cell = tableView.dequeueReusableCell(withIdentifier: DeviderCell.reuseIdentifier, for: indexPath) as! DeviderCell
            return cell
        case .notifications(let title):
            let cell = tableView.dequeueReusableCell(withIdentifier: SwitchCell.reuseIdentifier, for: indexPath) as! SwitchCell
            return cell
        case .help(let title):
            let cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.reuseIdentifier, for: indexPath) as! InfoCell
            return cell
        case .logOut(let title):
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonCell.reuseIdentifier, for: indexPath) as! ButtonCell
            return cell
        }
    }
}
