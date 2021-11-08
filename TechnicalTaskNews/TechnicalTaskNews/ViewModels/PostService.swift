//
//  NewsViewModel.swift
//  TechnicalTaskNews
//
//  Created by Jose Moffa on 11/6/21.
//

import Foundation
import Resolver

class PostService: ObservableObject {

    /// Array of post fetched from repository that feeds the UI
    @Published var postsList: [DomainPost] = []

    /// Repository Data Source
    @Injected private var dataSource: PostDataSource

    /// Get all post non deleted from the repository
    func getPosts() {
        dataSource.list { posts, error in
            if error != nil {
                print(error!)
            }

            if let list = posts {
                self.guaranteeMainthread {
                    self.postsList = list
                }
            }
        }
    }

    /// Delete a post from the repository
    /// - Parameter post: post to delete
    func deletePost(post: DomainPost) {
        dataSource.delete(post) { error in
            if error == nil {
                self.guaranteeMainthread {
                    self.postsList.removeAll(where: { $0.id == post.id })
                }
            }
        }
    }

    private func guaranteeMainthread(_ work: @escaping () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            DispatchQueue.main.async(execute: work)
        }
    }
}
