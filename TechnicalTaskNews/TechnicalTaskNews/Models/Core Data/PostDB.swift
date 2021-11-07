//
//  PostDB.swift
//  TechnicalTaskNews
//
//  Created by Jose Moffa on 11/7/21.
//

import Foundation
import CoreData

extension PostDB {
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
