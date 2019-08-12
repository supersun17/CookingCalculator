//
//  Step+CoreDataClass.swift
//  CookingCalculator
//
//  Created by Ming Sun on 8/12/19.
//  Copyright © 2019 Ming Sun. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Step)
public class Step: NSManagedObject, Codable {
    enum CodingKeys: String, CodingKey {
        case recipeName
        case recipeId
        case timePeriod
        case occupied
        case instructionStart
        case instructionEnd
    }

    @NSManaged public var recipeName: String?
    @NSManaged public var recipeId: String?
    @NSManaged public var timePeriod: Double
    @NSManaged public var occupied: Bool
    @NSManaged public var instructionStart: String?
    @NSManaged public var instructionEnd: String?
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Step> {
        return NSFetchRequest<Step>(entityName: "Step")
    }
    
    // MARK: - Decodable
    public required convenience init(from decoder: Decoder) throws {
        guard
            let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext,
            let entity = NSEntityDescription.entity(forEntityName: "Step", in: managedObjectContext) else {
                fatalError("Failed to decode User")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.recipeName = try container.decodeIfPresent(String.self, forKey: .recipeName)
        self.recipeId = try container.decodeIfPresent(String.self, forKey: .recipeId)
        self.timePeriod = try container.decodeIfPresent(Double.self, forKey: .timePeriod) ?? 0.0
        self.occupied = try container.decodeIfPresent(Bool.self, forKey: .occupied) ?? true
        self.instructionStart = try container.decodeIfPresent(String.self, forKey: .instructionStart)
        self.instructionEnd = try container.decodeIfPresent(String.self, forKey: .instructionEnd)
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(recipeName, forKey: .recipeName)
        try container.encode(recipeId, forKey: .recipeId)
        try container.encode(timePeriod, forKey: .timePeriod)
        try container.encode(occupied, forKey: .occupied)
        try container.encode(instructionStart, forKey: .instructionStart)
        try container.encode(instructionEnd, forKey: .instructionEnd)
    }
}
