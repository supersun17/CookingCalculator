//
//  StepEditingVC.swift
//  CookingCalculator
//
//  Created by Ming Sun on 2020/1/19.
//  Copyright © 2020 Ming Sun. All rights reserved.
//

import UIKit

class StepEditingVC: UIViewController, SplitScreenDetail, UIGestureRecognizerDelegate {
    var contentView: UIView { view as? StepEditingCV ?? StepEditingCV() }

    weak var master: SplitScreenMasterVC?

    override func loadView() {
        view = StepEditingCV()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addActions()
    }

    func addActions() {
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapped))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }

    @objc
    func tapped() {
        view.endEditing(true)
    }
}


extension StepEditingVC {
    func updateUI(_ data: Any?) {

    }
}
