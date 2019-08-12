//
//  RecipeClass+CoreDataClass.swift
//  CookingCalculator
//
//  Created by Ming Sun on 8/12/19.
//  Copyright © 2019 Ming Sun. All rights reserved.
//
//

import UIKit
import CoreData

public typealias AvailableLangauges = [String:String]

@objc(RecipeClass)
public class RecipeClass: NSManagedObject, Codable {
    enum CodingKeys: String, CodingKey {
        case recipeClassId
        case recipeClassName
    }
    
    @NSManaged public var recipeClassId: String?
    @NSManaged public var recipeClassName: AvailableLangauges?
    
    // MARK: - Decodable
    public required convenience init(from decoder: Decoder) throws {
        guard
            let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext,
            let entity = NSEntityDescription.entity(forEntityName: "RecipeClass", in: managedObjectContext) else {
                fatalError("Failed to decode User")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.recipeClassId = try container.decodeIfPresent(String.self, forKey: .recipeClassId)
        self.recipeClassName = try container.decodeIfPresent(AvailableLangauges.self, forKey: .recipeClassName)
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(recipeClassId, forKey: .recipeClassId)
        try container.encode(recipeClassName, forKey: .recipeClassName)
    }
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecipeClass> {
        return NSFetchRequest<RecipeClass>(entityName: "RecipeClass")
    }
}
