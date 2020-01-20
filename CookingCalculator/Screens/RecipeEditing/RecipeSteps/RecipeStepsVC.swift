//
//  RecipeEditingVC.swift
//  CookingCalculator
//
//  Created by Ming Sun on 8/5/19.
//  Copyright © 2019 Ming Sun. All rights reserved.
//

import UIKit

class RecipeStepsVC: BaseVC, SplitScreenMenu {
    var contentView: RecipeStepsCV { view as? RecipeStepsCV ?? RecipeStepsCV() }
    var recipe: Recipe?

    var recipeName: UILabel { contentView.recipeName }
    var recipeClass: UILabel { contentView.recipeClass }
    var reorderButton: UIButton { contentView.reorderButton }
    var instructionTableView: UITableView { contentView.instructionTableView }

    weak var master: SplitScreenMasterVC?

    override func loadView() {
        view = RecipeStepsCV()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        updateUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        showNavBar(true)
    }
    
    func setupUI() {
        addNavBarItem(to: .right, title: "Save", action: #selector(saveRecipe))
        reorderButton.addTarget(self, action: #selector(toggleRearrange), for: .touchUpInside)
        setupTableView()
    }
    
    func updateUI() {
        recipeName.text = recipe?.recipeName
        recipeClass.text = recipe?.recipeClassName
        instructionTableView.reloadData()
    }
}

extension RecipeStepsVC {
    @objc
    func saveRecipe(_ button: UIButton) {
        recipe?.saveToDisk { _ in }
    }

    @objc
    func toggleRearrange() {
        instructionTableView.setEditing(!instructionTableView.isEditing, animated: true)
        reorderButton.setTitle(instructionTableView.isEditing ? "Done" : "Reorder", for: .normal)
    }
}

extension RecipeStepsVC: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        instructionTableView.dataSource = self
        instructionTableView.delegate = self
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
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ReusableCell")
            cell.selectionStyle = .gray
        }
        guard let step = recipe?.steps?[indexPath.row] else {
            return cell
        }
        cell.textLabel?.text = step.recipeName
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = String(format: "In %1$.02f seconds \n%2$@", step.timePeriod, step.instructionStart ?? "")
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

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if let cell = tableView.cellForRow(at: indexPath),
           cell.isSelected {
            cell.isSelected = false
            self.tableView(tableView, didDeselectRowAt: indexPath)
            return nil
        } else {
            return indexPath
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        master?.showDetail()
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        master?.hideDetail()
    }
}
