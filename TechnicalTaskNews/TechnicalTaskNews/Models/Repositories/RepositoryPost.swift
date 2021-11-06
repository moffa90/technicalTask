//
//  NewsRepository.swift
//  TechnicalTaskNews
//
//  Created by Jose Moffa on 11/6/21.
//

import Foundation

enum RepositoryError: Error {
    case notFound
}

struct RepositoryPost: Repository {
    typealias T = DomainPost
    
    func get(id: Int, completionHandler: @escaping (DomainPost?, Error?) -> Void) {}
    
    func list(completionHandler:  @escaping ([DomainPost]?, Error?) -> Void) {
        let url = URL(string: "https://hn.algolia.com/api/v1/search_by_date?query=mobile")!
        
        let task = URLSession.shared.dataTask(with: url) { (news: News?, response: URLResponse?, error: Error?) in
            if let error = error {
                completionHandler(nil, error)
                return
            }
            
            guard let apiData = news else {
                completionHandler(nil, RepositoryError.notFound)
                return
            }
            
            var domainPosts: [DomainPost] = []
            
            apiData.hits.forEach { hit in
                domainPosts.append(
                    DomainPost(
                        id: hit.objectID,
                        storyTitle: hit.storyTitle,
                        title: hit.title,
                        author: hit.author,
                        created_at_i: hit.createdAtI
                    )
                )
            }
            
            completionHandler(domainPosts, nil)
        }
        
        task.resume()
    }
    
    func add(_ item: DomainPost, completionHandler:  @escaping (Error?) -> Void) {}
    
    func delete(_ item: DomainPost, completionHandler:  @escaping (Error?) -> Void) {}
    
    func edit(_ item: DomainPost, completionHandler:  @escaping (Error?) -> Void) {}
}
