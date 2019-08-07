//
//  SceneProtocol.swift
//  CookingCalculator
//
//  Created by Ming Sun on 8/5/19.
//  Copyright © 2019 Ming Sun. All rights reserved.
//

import UIKit

protocol SceneProtocol: AnyObject {
    func setupScene() -> UIViewController
    func dismissScene(_ completion: @escaping () -> Void)
}
