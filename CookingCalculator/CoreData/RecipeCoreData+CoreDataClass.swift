//
//  RecipeCoreData+CoreDataClass.swift
//  CookingCalculator
//
//  Created by Ming Sun on 8/12/19.
//  Copyright © 2019 Ming Sun. All rights reserved.
//
//

import UIKit
import CoreData

@objc(RecipeCoreData)
class RecipeCoreData: NSManagedObject {
    @NSManaged public var ownerId: String?
    @NSManaged public var quota: Int64
    @NSManaged public var recipeClassId: String?
    @NSManaged public var recipeClassName: String?
    @NSManaged public var recipeId: String?
    @NSManaged public var recipeName: String?
    @NSManaged public var steps: Data?

    @discardableResult
    convenience init(from model: Recipe) {
        guard let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext,
              let entity = NSEntityDescription.entity(forEntityName: "RecipeCoreData", in: managedObjectContext) else {
                fatalError("Failed to decode User")
        }
        self.init(entity: entity, insertInto: managedObjectContext)
        self.ownerId = model.ownerId
        self.quota = model.quota
        self.recipeClassId = model.recipeClassId
        self.recipeClassName = model.recipeClassName
        self.recipeId = model.recipeId
        self.recipeName = model.recipeName
        if let data = DataConversion.encode(model.steps) { self.steps = data }
    }

    @nonobjc class func fetch(completion: @escaping ([Recipe]?) -> Void) {
        DispatchQueue.main.async {
            guard let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
                fatalError("Failed to decode User")
            }
            let fetchRequest = NSFetchRequest<RecipeCoreData>(entityName: "RecipeCoreData")
            guard let cdList = try? managedObjectContext.fetch(fetchRequest) else {
                completion(nil)
                return
            }
            let recipeList = cdList.map { Recipe(from: $0) }
            completion(recipeList)
        }
    }

    func updateProperties(from model: Recipe) {
        self.ownerId = model.ownerId
        self.quota = model.quota
        self.recipeClassId = model.recipeClassId
        self.recipeClassName = model.recipeClassName
        self.recipeId = model.recipeId
        self.recipeName = model.recipeName
        if let data = DataConversion.encode(model.steps) { self.steps = data }
    }

    @nonobjc class func save(completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.async {
            guard let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
                fatalError("Failed to decode User")
            }
            do {
                try managedObjectContext.save()
                completion(true)
            } catch (let error) {
                print("could not save. \(error)")
                completion(false)
            }
        }
    }
}
