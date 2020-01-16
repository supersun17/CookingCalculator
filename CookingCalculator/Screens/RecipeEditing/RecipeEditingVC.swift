//
//  RecipeEditingVC.swift
//  CookingCalculator
//
//  Created by Ming Sun on 8/5/19.
//  Copyright © 2019 Ming Sun. All rights reserved.
//

import UIKit

class RecipeEditingVC: BaseVC {
    var recipe: Recipe?
    
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeClassNameLabel: UILabel!
    @IBOutlet weak var rearrangeButton: UIButton!
    @IBOutlet weak var instructionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        updateUI()
    }
    
    func setupUI() {
        showNavBar(true)
        setupTableView()
        rearrangeButton.layer.cornerRadius = 4.0
    }
    
    func updateUI() {
        recipeNameLabel.text = recipe?.recipeName
        recipeClassNameLabel.text = recipe?.recipeClassName
        instructionTableView.reloadData()
    }

    @IBAction func save(_ sender: UIButton) {
        saveRecipe()
    }

    @IBAction func rearrange(_ sender: UIButton) {
        instructionTableView.setEditing(!instructionTableView.isEditing, animated: true)
    }
}

extension RecipeEditingVC {
    private func saveRecipe() {
        recipe?.saveToDisk { _ in }
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
        return recipe?.steps?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        if let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell") {
            cell = dequeueCell
        } else {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "ReusableCell")
        }
        guard let step = recipe?.steps?[indexPath.row] else {
            return cell
        }
        cell.textLabel?.text = step.recipeName
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = String.init(format: "In %1$.02f seconds \n%2$@", step.timePeriod, step.instructionStart ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        guard let source = recipe?.steps?.remove(at: sourceIndexPath.row) else {
            return
        }
        recipe?.steps?.insert(source, at: destinationIndexPath.row)
    }
}
