//
//  MenuViewController.swift
//  SideMenuUsingStoryboard
//
//  Created by Julio Collado on 12/10/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit
import os.log

class MenuTableViewController: UITableViewController {
    
    typealias MenuTypeAction = ((SideMenuOptions) -> Void)
    
    var didTapMenuType: MenuTypeAction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "MenuTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MenuTableViewCell.reuseIdentifier)
    }
    
}

extension MenuTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SideMenuOptions.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.reuseIdentifier) as! MenuTableViewCell
        cell.iconImageView.image = SideMenuOptions(rawValue: indexPath.row)?.image
        cell.menuOptionLabel.text = SideMenuOptions(rawValue: indexPath.row)?.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuOption = SideMenuOptions(rawValue: indexPath.row) else { return }
        dismiss(animated: true) { [weak self] in
            os_log("Did tap %@ option", log: .userAction, type: .info, menuOption.description)
            self?.didTapMenuType?(menuOption)
        }
    }
}
