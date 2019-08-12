//
//  Recipe+CoreDataClass.swift
//  CookingCalculator
//
//  Created by Ming Sun on 8/12/19.
//  Copyright © 2019 Ming Sun. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Recipe)
public class Recipe: NSManagedObject, Codable {
    enum CodingKeys: String, CodingKey {
        case recipeId
        case ownerId
        case recipeName
        case recipeClass
        case quota
        case process
    }
    
    @NSManaged public var recipeId: String?
    @NSManaged public var ownerId: String?
    @NSManaged public var recipeName: String?
    @NSManaged public var recipeClass: String?
    @NSManaged public var quota: Int64
    @NSManaged public var process: [Step]?
    
    // MARK: - Decodable
    public required convenience init(from decoder: Decoder) throws {
        guard
            let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext,
            let entity = NSEntityDescription.entity(forEntityName: "Recipe", in: managedObjectContext) else {
                fatalError("Failed to decode User")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.recipeId = try container.decodeIfPresent(String.self, forKey: .recipeId)
        self.ownerId = try container.decodeIfPresent(String.self, forKey: .ownerId)
        self.recipeName = try container.decodeIfPresent(String.self, forKey: .recipeName)
        self.recipeClass = try container.decodeIfPresent(String.self, forKey: .recipeClass)
        self.quota = try container.decodeIfPresent(Int64.self, forKey: .quota) ?? 1
        self.process = try container.decodeIfPresent([Step].self, forKey: .process)
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(recipeId, forKey: .recipeId)
        try container.encode(ownerId, forKey: .ownerId)
        try container.encode(recipeName, forKey: .recipeName)
        try container.encode(recipeClass, forKey: .recipeClass)
        try container.encode(quota, forKey: .quota)
        try container.encode(process, forKey: .process)
    }
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }
}
