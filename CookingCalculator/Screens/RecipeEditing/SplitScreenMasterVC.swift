//
//  SplitScreenMasterVC.swift
//  CookingCalculator
//
//  Created by Ming Sun on 2020/1/19.
//  Copyright © 2020 Ming Sun. All rights reserved.
//

import UIKit

protocol SplitScreenMenu: UIViewController {
    var master: SplitScreenMasterVC? { get set }
}

protocol SplitScreenDetail: UIViewController {
    var master: SplitScreenMasterVC? { get set }
    func updateUI(_ data: Any?)
    func updatedData() -> Any?
}

class SplitScreenMasterVC: BaseVC {
    var menu: SplitScreenMenu
    var detail: SplitScreenDetail

    weak var menuWidthLayoutSave: NSLayoutConstraint?


    init(with menuImplementation: SplitScreenMenu, detailImplementation: SplitScreenDetail) {
        menu = menuImplementation
        detail = detailImplementation
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("no xib nor storyboard") }

    deinit {
        print("\(self.description) did release")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        showNavBar(true)
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground

        menu.master = self
        detail.master = self
        view.addSubview(menu.view)
        view.addSubview(detail.view)
        menu.view.translatesAutoresizingMaskIntoConstraints = false
        detail.view.translatesAutoresizingMaskIntoConstraints = false

        var constraints: [NSLayoutConstraint] = []
        let menuWidthLayout = menu.view.widthAnchor.constraint(equalTo: view.widthAnchor)
        menuWidthLayoutSave = menuWidthLayout
        constraints += [
            menuWidthLayout,
            menu.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menu.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menu.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        constraints += [
            detail.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detail.view.leadingAnchor.constraint(equalTo: menu.view.trailingAnchor),
            detail.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            detail.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

extension SplitScreenMasterVC {
    func showDetail(_ content: Any?) {
        menuWidthLayoutSave?.constant = -1.0 * view.frame.width * 0.7
        UIView.animate(withDuration: 0.6) {
            self.view.layoutIfNeeded()
        }

        detail.updateUI(content)
    }

    func hideDetail() {
        menuWidthLayoutSave?.constant = 0.0
        UIView.animate(withDuration: 0.6) {
            self.view.layoutIfNeeded()
        }

        detail.updateUI(nil)
    }
}
