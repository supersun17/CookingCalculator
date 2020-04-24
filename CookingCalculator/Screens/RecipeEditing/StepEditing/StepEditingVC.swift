//
//  StepEditingVC.swift
//  CookingCalculator
//
//  Created by Ming Sun on 2020/1/19.
//  Copyright © 2020 Ming Sun. All rights reserved.
//

import UIKit

class StepEditingVC: UIViewController, SplitScreenDetail, UIGestureRecognizerDelegate {
    var contentView: StepEditingCV { view as? StepEditingCV ?? StepEditingCV() }

    weak var master: SplitScreenMasterVC?

    private var step: Step?

    
    override func loadView() {
        view = StepEditingCV()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addActions()
    }

    func addActions() {
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapped))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }

    @objc
    func tapped() {
        view.endEditing(true)
    }
}


extension StepEditingVC {
    func updateUI(_ data: Any?) {
        guard let step = data as? Step else { return }
        self.step = step

        contentView.timePeriod.content.text = step.timePeriod.description
        contentView.occupied.content.text = step.occupied.description
        contentView.instructionStart.content.text = step.instructionStart
        contentView.instructionEnd.content.text = step.instructionEnd
    }

    func updatedData() -> Any? {
        step?.timePeriod = Double(contentView.timePeriod.content.text ?? "0.0") ?? 0.0
        step?.occupied = contentView.occupied.content.text?.lowercased() == "true"
        step?.instructionStart = contentView.instructionStart.content.text
        step?.instructionEnd = contentView.instructionEnd.content.text
        return step
    }
}
