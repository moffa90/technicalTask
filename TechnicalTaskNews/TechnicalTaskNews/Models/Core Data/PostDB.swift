//
//  PostDB.swift
//  TechnicalTaskNews
//
//  Created by Jose Moffa on 11/7/21.
//

import Foundation
import CoreData

extension PostDB {

    /// Gets all the PostDB records from db where hide == true and sorted by date desc
    /// - Parameter context: Context for Core Data db
    /// - Returns: List of results
    static func getAll(context: NSManagedObjectContext) -> [PostDB] {
        let fetchRequest: NSFetchRequest<PostDB>
        fetchRequest = PostDB.fetchRequest()

        let sort = NSSortDescriptor(key: "createdAtI", ascending: false)
        fetchRequest.sortDescriptors = [sort]

        fetchRequest.predicate = NSPredicate(format: "hide = %@", "false")

        do {
            let dbPosts = try context.fetch(fetchRequest)
            return dbPosts
        } catch let error {
            print(error)
            return []
        }
    }

    /// Gets the first PostDB from DB where it matches with the given objectId
    /// - Parameters:
    ///   - objectId: Given ID to apply the search
    ///   - context: Context for Core Data db
    /// - Returns: First result that matches with the criteria else nil
    static func getFirst(objectId: String, context: NSManagedObjectContext) -> PostDB? {
        let fetchRequest: NSFetchRequest<PostDB>
        fetchRequest = PostDB.fetchRequest()

        fetchRequest.predicate = NSPredicate(
                format: "objectId = %@", objectId
        )
        fetchRequest.fetchLimit = 1

        do {
            let dbPost = try context.fetch(fetchRequest).first
            return dbPost
        } catch {
            return nil
        }
    }

    /// Custom Init function to fill al the fields
    convenience init(objectId: String, title: String?, storyTitle: String?, url: String?, author: String, createdAtI: Int64, context: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: "PostDB", in: context)!
        self.init(entity: entity, insertInto: context)

        self.objectId = objectId
        self.title = title
        self.storyTitle = storyTitle
        self.url = url
        self.author = author
        self.createdAtI = createdAtI
    }
}
