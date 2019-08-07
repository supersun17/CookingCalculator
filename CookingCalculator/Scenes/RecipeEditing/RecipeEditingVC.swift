//
//  RecipeEditingVC.swift
//  CookingCalculator
//
//  Created by Ming Sun on 8/5/19.
//  Copyright © 2019 Ming Sun. All rights reserved.
//

import UIKit

class RecipeEditingVC: UIViewController {
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var instructionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        extractRecipe()
    }
    
    private func extractRecipe() -> Recipe? {
        guard let recipe = Bundle.main.url(forResource: "recipe", withExtension: "xml"),
            let recipeClass = Bundle.main.url(forResource: "recipeClass", withExtension: "xml"),
            let recipeString = try? String.init(contentsOf: recipe),
            let recipeClassString = try? String.init(contentsOf: recipeClass)
            else {
                return nil
        }
        
        return ""
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
