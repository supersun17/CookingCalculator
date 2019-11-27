//
//  parentScene.swift
//  CookingCalculator
//
//  Created by Ming Sun on 8/5/19.
//  Copyright © 2019 Ming Sun. All rights reserved.
//

import UIKit

class ParentScene: SceneProtocol {
    
    private(set) weak var dependencies: Dependencies?
    init(dependencies: Dependencies?) {
        self.dependencies = dependencies
    }
    
    private(set) var mainVC: SceneVCProtocol?
    var recipeEditingScene: RecipeEditingScene?



    func setupUI() {
        recipeEditingScene = recipeEditingScene ?? RecipeEditingScene(dependencies: dependencies)
        recipeEditingScene?.setupUI()
        mainVC = recipeEditingScene?.mainVC
    }

    func dismissUI(_ completion: @escaping () -> Void) {
        mainVC?.removeFromParent()
        mainVC = nil
    }
}
