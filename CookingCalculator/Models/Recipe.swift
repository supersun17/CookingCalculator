//
//  Recipe.swift
//  CookingCalculator
//
//  Created by Ming Sun on 2020/1/15.
//  Copyright © 2020 Ming Sun. All rights reserved.
//

import Foundation

struct Recipe: Codable {
    var ownerId: String?
    var quota: Int64
    var recipeClassId: String?
    var recipeClassName: String?
    var recipeId: String?
    var recipeName: String?
    var steps: [Step]?

    enum CodingKeys: String, CodingKey {
        case recipeId
        case ownerId
        case recipeName
        case recipeClassId
        case recipeClassName
        case quota
        case steps
    }

    init(from cd: RecipeCoreData) {
        ownerId = cd.ownerId
        quota = cd.quota
        recipeClassId = cd.recipeClassId
        recipeClassName = cd.recipeClassName
        recipeId = cd.recipeId
        recipeName = cd.recipeName
        if let unarchivedSteps = DataConversion.decode(cd.steps) as [Step]? { steps = unarchivedSteps }
    }

    func saveToDisk(completion: @escaping (Bool) -> Void) {
        RecipeCoreData(from: self)
        RecipeCoreData.save { completion($0) }
    }

    static func fetchAll(completion: @escaping ([Recipe]?) -> Void) {
        RecipeCoreData.fetch { completion($0) }
    }
}
