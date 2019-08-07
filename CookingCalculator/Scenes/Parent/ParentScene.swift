//
//  parentScene.swift
//  CookingCalculator
//
//  Created by Ming Sun on 8/5/19.
//  Copyright © 2019 Ming Sun. All rights reserved.
//

import UIKit

class ParentScene: SceneProtocol {
    var recipeEditingScene: RecipeEditingScene?
    
    func dismissScene(_ completion: @escaping () -> Void) {}
    
    func setupScene() -> UIViewController {
        let scene = recipeEditingScene ?? RecipeEditingScene()
        recipeEditingScene = scene
        return scene.setupScene()
    }
}
