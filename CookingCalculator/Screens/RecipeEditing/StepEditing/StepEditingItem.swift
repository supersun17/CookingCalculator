//
//  StepEditingItem.swift
//  CookingCalculator
//
//  Created by Ming Sun on 2020/1/19.
//  Copyright © 2020 Ming Sun. All rights reserved.
//

import UIKit

class StepEditingItem: UIView {
    lazy var title: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.preferredFont(forTextStyle: .subheadline)
        lbl.backgroundColor = .clear
        lbl.textColor = .label
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .horizontal)
        return lbl
    }()
    lazy var content: UITextField = {
        let txf = UITextField()
        txf.backgroundColor = .white
        txf.textColor = .black
        txf.translatesAutoresizingMaskIntoConstraints = false
        return txf
    }()

    
    init(with title: String) {
        super.init(frame: .zero)
        
        setupViews(with: title)
        setupLayout()
    }

    required init?(coder: NSCoder) { fatalError("no xib nor storyboard") }

    func setupViews(with titleText: String) {
        title.text = titleText
        addSubview(title)
        addSubview(content)
    }

    func setupLayout() {
        var constraints: [NSLayoutConstraint] = []
        constraints += [
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        constraints += [
            content.heightAnchor.constraint(equalToConstant: 36.0),
            content.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4.0),
            content.leadingAnchor.constraint(equalTo: leadingAnchor),
            content.bottomAnchor.constraint(equalTo: bottomAnchor),
            content.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
