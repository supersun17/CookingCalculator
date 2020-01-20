//
//  StepEditingCV.swift
//  CookingCalculator
//
//  Created by Ming Sun on 2020/1/19.
//  Copyright © 2020 Ming Sun. All rights reserved.
//

import UIKit

class StepEditingCV: UIView {
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 4.0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    lazy var timePeriod: StepEditingItem = {
        let item = StepEditingItem(with: "Time period")
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    lazy var occupied: StepEditingItem = {
        let item = StepEditingItem(with: "Occupied")
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    lazy var instructionStart: StepEditingItem = {
        let item = StepEditingItem(with: "Instruction start")
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    lazy var instructionEnd: StepEditingItem = {
        let item = StepEditingItem(with: "Instruction end")
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .secondarySystemBackground
        setupViews()
        setupLayout()
    }

    required init?(coder: NSCoder) { fatalError("no xib nor storyboard") }

    func setupViews() {
        addSubview(stackView)
            stackView.addArrangedSubview(timePeriod)
            stackView.addArrangedSubview(occupied)
            stackView.addArrangedSubview(instructionStart)
            stackView.addArrangedSubview(instructionEnd)
    }

    func setupLayout() {
        var constraints: [NSLayoutConstraint] = []
        constraints += [
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1.0 * 8.0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
