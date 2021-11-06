//
//  NewsView.swift
//  TechnicalTaskNews
//
//  Created by Jose Moffa on 11/6/21.
//

import SwiftUI

struct NewsView: View{
    
    @StateObject private var model = NewsViewModel()
    
    var body: some View {
        List(model.postsList){ post in
            Post(post: post)
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive, action: {model.deletePost(post: post)} ) {
                        Label("Delete", systemImage: "trash.fill")
                    }
                }
        }
        .navigationTitle("Posts")
        .refreshable {
            model.getPosts()
        }
        .onAppear {
            model.getPosts()
        }
    }
}

struct Post: View {
    let title: String
    let author: String
    let date: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16.0){
            VStack(alignment: .leading, spacing: 8.0) {
                Text(title).font(.headline)
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                    Text("\(author) - \(date)")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.top, 16.0)
    }
}

extension Post {
    init(post: DomainPost){
        title = post.title ?? post.storyTitle ?? "No title"
        author = post.author
        let d: Date! = Date(timeIntervalSince1970: TimeInterval(post.created_at_i))
        date = d.timeAgoDisplay()
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        Post(post: DomainPost(
            id: "",
            storyTitle: "Story Title",
            title: "Title",
            author: "Jose Moffa",
            created_at_i: 1636152795))
    }
}
