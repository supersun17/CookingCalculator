//
//  RecipeStepsCV.swift
//  CookingCalculator
//
//  Created by Ming Sun on 2020/1/19.
//  Copyright © 2020 Ming Sun. All rights reserved.
//

import UIKit

class RecipeStepsCV: UIView {
    lazy var recipeName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.preferredFont(forTextStyle: .title1)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    lazy var recipeClass: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .secondaryLabel
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    lazy var reorderButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .label
        btn.setTitle("Reorder", for: .normal)
        btn.setTitleColor(.systemBackground, for: .normal)
        btn.layer.cornerRadius = 4.0
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    lazy var instructionTableView: UITableView = {
        let tbv = UITableView()
        tbv.translatesAutoresizingMaskIntoConstraints = false
        return tbv
    }()

    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .systemBackground
        setupUI()
        setupLayout()
    }

    required init?(coder: NSCoder) { fatalError("no xib nor storyboard") }

    func setupUI() {
        addSubview(recipeName)
        addSubview(recipeClass)
        addSubview(reorderButton)
        addSubview(instructionTableView)
    }

    func setupLayout() {
        var constraints: [NSLayoutConstraint] = []
        let sideSpacing: CGFloat = 20.0
        constraints += [
            recipeName.heightAnchor.constraint(equalToConstant: 30.0),
            recipeName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20.0),
            recipeName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sideSpacing),
            recipeName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: sideSpacing * -1.0)
        ]
        constraints += [
            recipeClass.heightAnchor.constraint(equalToConstant: 30.0),
            recipeClass.topAnchor.constraint(equalTo: recipeName.bottomAnchor, constant: 4.0),
            recipeClass.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sideSpacing),
            recipeClass.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: sideSpacing * -1.0)
        ]
        constraints += [
            reorderButton.heightAnchor.constraint(equalToConstant: 30.0),
            reorderButton.widthAnchor.constraint(equalToConstant: 80.0),
            reorderButton.topAnchor.constraint(equalTo: recipeClass.bottomAnchor, constant: 20.0),
            reorderButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sideSpacing)
        ]
        constraints += [
            instructionTableView.topAnchor.constraint(equalTo: reorderButton.bottomAnchor, constant: 20.0),
            instructionTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: sideSpacing),
            instructionTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            instructionTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: sideSpacing * -1.0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
