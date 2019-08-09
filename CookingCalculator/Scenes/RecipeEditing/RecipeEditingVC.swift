//
//  RecipeEditingVC.swift
//  CookingCalculator
//
//  Created by Ming Sun on 8/5/19.
//  Copyright © 2019 Ming Sun. All rights reserved.
//

import UIKit

class RecipeEditingVC: UIViewController {
    var recipe: Recipe?
    
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeClassNameLabel: UILabel!
    @IBOutlet weak var rearrangeButton: UIButton!
    @IBOutlet weak var instructionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        recipe = extractRecipe()
        updateUI()
    }
    
    func setupUI() {
        setupTableView()
        rearrangeButton.layer.cornerRadius = 4.0
    }
    
    func updateUI() {
        recipeNameLabel.text = recipe?.recipeName
        instructionTableView.reloadData()
    }
    
    private func extractRecipe() -> Recipe? {
        guard let recipe = Bundle.main.url(forResource: "Recipe", withExtension: "json"),
            let recipeData = try? Data.init(contentsOf: recipe)
            else {
                return nil
        }
        return try? JSONDecoder().decode(Recipe.self, from: recipeData)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func rearrange(_ sender: UIButton) {
        instructionTableView.setEditing(!instructionTableView.isEditing, animated: true)
        if instructionTableView.isEditing == false {
            instructionTableView.reloadData()
        }
    }
}

extension RecipeEditingVC: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        instructionTableView.dataSource = self
        instructionTableView.delegate = self
        instructionTableView.allowsSelection = false
        instructionTableView.bounces = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe?.process.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        if let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell") {
            cell = dequeueCell
        } else {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "ReusableCell")
        }
        let step = recipe!.process[indexPath.row]
        cell.textLabel?.text = step.recipeName
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = String.init(format: "In %1$.02f seconds \n%2$@", step.timePeriod, step.instructionStart)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        guard let source = recipe?.process.remove(at: sourceIndexPath.row) else {
            return
        }
        recipe?.process.insert(source, at: destinationIndexPath.row)
    }
}
