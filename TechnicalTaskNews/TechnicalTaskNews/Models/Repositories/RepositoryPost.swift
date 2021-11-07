//
//  NewsRepository.swift
//  TechnicalTaskNews
//
//  Created by Jose Moffa on 11/6/21.
//

import Foundation
import CoreData
import Resolver

enum RepositoryError: Error {
    case notFound
}

struct RepositoryPost: Repository {
    typealias Generic = DomainPost

    @Injected var context: NSManagedObjectContext

    func get(id: Int, completionHandler: @escaping (DomainPost?, Error?) -> Void) {
    }

    func list(completionHandler: @escaping ([DomainPost]?, Error?) -> Void) {
        let url = URL(string: "https://hn.algolia.com/api/v1/search_by_date?query=mobile")!

        let task = URLSession.shared.dataTask(with: url) { (news: News?, _: URLResponse?, error: Error?) in
            if let error = error {
                print(error)
            }

            var domainPosts: [DomainPost] = []

            if news != nil {
                news!.hits.forEach { hit in
                    _ = PostDB(
                        objectId: hit.objectID,
                        title: hit.title,
                        storyTitle: hit.storyTitle,
                        url: hit.storyURL,
                        author: hit.author,
                        createdAtI: Int64(hit.createdAtI),
                        context: context
                    )
                }

                do {
                    try context.save()
                } catch let error {
                    print(error)
                }
            }

            for dbPost in PostDB.getAll(context: context) {
                domainPosts.append(
                    DomainPost(
                        id: dbPost.objectId!,
                        storyTitle: dbPost.storyTitle,
                        title: dbPost.title,
                        author: dbPost.author ?? "",
                        url: dbPost.url,
                        createdAtI: Int(dbPost.createdAtI)
                    )
                )
                completionHandler(domainPosts, nil)
            }
        }

        task.resume()
    }

    func add(_ item: DomainPost, completionHandler: @escaping (Error?) -> Void) {
    }

    func delete(_ item: DomainPost, completionHandler: @escaping (Error?) -> Void) {
        do {
            if let dbPost = PostDB.getFirst(objectId: item.id, context: context) {
                dbPost.hide = true
                try context.save()
            }
            completionHandler(nil)
        } catch {
            completionHandler(error)
        }
    }

    func edit(_ item: DomainPost, completionHandler: @escaping (Error?) -> Void) {
    }
}
