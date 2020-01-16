//
//  BaseVC.swift
//  CookingCalculator
//
//  Created by Ming Sun on 2020/1/16.
//  Copyright © 2020 Ming Sun. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // back button arrow & text color
        navigationController?.navigationBar.tintColor = .black
        // nav bar color
        navigationController?.navigationBar.barTintColor = .white
    }

    func showNavBar(_ show: Bool) {
        navigationController?.navigationBar.isHidden = !show
    }
}
