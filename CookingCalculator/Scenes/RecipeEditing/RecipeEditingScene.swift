//
//  RecipeEditingScene.swift
//  CookingCalculator
//
//  Created by Ming Sun on 8/7/19.
//  Copyright © 2019 Ming Sun. All rights reserved.
//

import UIKit

class RecipeEditingScene: SceneProtocol {

    private(set) weak var dependencies: Dependencies?
    init(dependencies: Dependencies?) {
        self.dependencies = dependencies
    }

    private(set) var mainVC: SceneVCProtocol?

    func setupUI() {
        mainVC = mainVC ?? RecipeEditingVC(scene: self)
    }
    
    func dismissUI(_ completion: @escaping () -> Void) {
        mainVC?.removeFromParent()
        mainVC = nil
    }

    func extractRecipe() -> Recipe? {
        guard let recipe = Bundle.main.url(forResource: "Recipe", withExtension: "json"),
            let recipeData = try? Data.init(contentsOf: recipe)
            else {
                return nil
        }
        return try? JSONDecoder().decode(Recipe.self, from: recipeData)
    }
}
