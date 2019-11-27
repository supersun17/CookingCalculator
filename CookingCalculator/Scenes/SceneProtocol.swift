//
//  SceneProtocol.swift
//  CookingCalculator
//
//  Created by Ming Sun on 8/5/19.
//  Copyright © 2019 Ming Sun. All rights reserved.
//

import UIKit

protocol SceneProtocol: AnyObject {
    var mainVC: SceneVCProtocol? { get }

    func setupUI()
    func dismissUI(_ completion: @escaping () -> Void)
}

protocol SceneVCProtocol: UIViewController {
    var scene: SceneProtocol? { get }
}
