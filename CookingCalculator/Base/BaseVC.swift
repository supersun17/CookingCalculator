//
//  BaseVC.swift
//  CookingCalculator
//
//  Created by Ming Sun on 2020/1/16.
//  Copyright © 2020 Ming Sun. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    enum NavBarItemPosition {
        case left, right
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // back button arrow & text color
        navigationController?.navigationBar.tintColor = .label
        // nav bar color
        navigationController?.navigationBar.barTintColor = .systemBackground
    }

    func showNavBar(_ show: Bool) {
        navigationController?.navigationBar.isHidden = !show
    }

    func addNavBarItem(to position: NavBarItemPosition, title: String, action: Selector?) {
        let item = UIBarButtonItem(title: title, style: .plain, target: self, action: action)
        var items = position == .left ? navigationItem.leftBarButtonItems : navigationItem.rightBarButtonItems
        if items == nil {
            items = [item]
        } else {
            items?.append(item)
        }
    }
}
