//
//  NewsViewModel.swift
//  TechnicalTaskNews
//
//  Created by Jose Moffa on 11/6/21.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var postsList: [DomainPost] = []
    
    func getPosts(){
        let repository = RepositoryPost()
        repository.list { posts, error in
            if let e = error {
                print(e)
            }
            
            if let list = posts {
                DispatchQueue.main.async {
                    self.postsList = list
                }
            }
        }
    }
    
    func deletePost(post: DomainPost){
        DispatchQueue.main.async {
            self.postsList.removeAll(where: { $0.id == post.id })
        }
    }
}
