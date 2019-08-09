//
//  RecipeEditingScene.swift
//  CookingCalculator
//
//  Created by Ming Sun on 8/7/19.
//  Copyright © 2019 Ming Sun. All rights reserved.
//

import UIKit

class RecipeEditingScene: SceneProtocol {
    func setupScene() -> UIViewController {
        return RecipeEditingVC()
    }
    
    func dismissScene(_ completion: @escaping () -> Void) {}
}
