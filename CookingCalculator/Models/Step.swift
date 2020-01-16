//
//  Step.swift
//  CookingCalculator
//
//  Created by Ming Sun on 2020/1/15.
//  Copyright © 2020 Ming Sun. All rights reserved.
//

import Foundation

struct Step: Codable {
    var instructionEnd: String?
    var instructionStart: String?
    var occupied: Bool
    var recipeId: String?
    var recipeName: String?
    var timePeriod: Double

    enum CodingKeys: String, CodingKey {
        case instructionEnd
        case instructionStart
        case occupied
        case recipeId
        case recipeName
        case timePeriod
    }
}
