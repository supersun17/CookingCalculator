//
//  RecipeListVC.swift
//  CookingCalculator
//
//  Created by Ming Sun on 2020/1/16.
//  Copyright © 2020 Ming Sun. All rights reserved.
//

import UIKit

class RecipeListVC: BaseVC {
    var recipeList: [Recipe] = []

    @IBOutlet weak var addExample: UIButton!
    @IBOutlet weak var addNewRecipe: UIButton!
    @IBOutlet weak var recipeTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        showNavBar(false)
        Recipe.fetchAll { [weak self] recipeList in
            guard let self = self else {
                return
            }
            self.recipeList = recipeList ?? []
            self.updateUI()
        }
    }

    func setupUI() {
        addNewRecipe.layer.cornerRadius = 20
        setupTableView()
    }

    func updateUI() {
        recipeTableView.reloadData()
    }

    @IBAction func addExample(_ sender: UIButton) {
        let recipeStepsVC = RecipeStepsVC()
        recipeStepsVC.recipe = extractRecipe()
        let splitScreenMasterVC = SplitScreenMasterVC(with: recipeStepsVC,
                                                      detailImplementation: StepEditingVC())
        navigationController?.pushViewController(splitScreenMasterVC, animated: true)
    }

    private func extractRecipe() -> Recipe? {
        guard let recipe = Bundle.main.url(forResource: "Recipe", withExtension: "json"),
            let recipeData = try? Data.init(contentsOf: recipe)
            else {
                return nil
        }
        return try? JSONDecoder().decode(Recipe.self, from: recipeData)
    }
}

extension RecipeListVC: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        recipeTableView.dataSource = self
        recipeTableView.delegate = self
        recipeTableView.bounces = false
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        if let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell") {
            cell = dequeueCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ReusableCell")
            cell.selectionStyle = .none
        }
        let recipe = recipeList[indexPath.row]
        cell.textLabel?.text = recipe.recipeName
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = String.init(format: "Recipe ID %2$@", recipe.recipeId ?? "")
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = recipeList[indexPath.row]
        let recipeStepsVC = RecipeStepsVC()
        recipeStepsVC.recipe = recipe
        let splitScreenMasterVC = SplitScreenMasterVC(with: recipeStepsVC,
                                                  detailImplementation: StepEditingVC())
        navigationController?.pushViewController(splitScreenMasterVC, animated: true)
    }
}
