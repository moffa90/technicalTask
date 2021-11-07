//
//  NewsViewModel.swift
//  TechnicalTaskNews
//
//  Created by Jose Moffa on 11/6/21.
//

import Foundation
import Resolver

class NewsViewModel: ObservableObject {
    @Published var postsList: [DomainPost] = []
    @Injected private var repository: RepositoryPost

    func getPosts() {
        repository.list { posts, error in
            if error != nil {
                print(error!)
            }

            if let list = posts {
                DispatchQueue.main.async {
                    self.postsList = list
                }
            }
        }
    }

    func deletePost(post: DomainPost) {
        repository.delete(post) { error in
            if error == nil {
                DispatchQueue.main.async {
                    self.postsList.removeAll(where: { $0.id == post.id })
                }
            }
        }
    }
}
