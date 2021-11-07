//
//  NewsView.swift
//  TechnicalTaskNews
//
//  Created by Jose Moffa on 11/6/21.
//

import SwiftUI
import Resolver

struct NewsView: View {

    @InjectedObject private var model: NewsViewModel

    var body: some View {
        List(model.postsList) { post in
            NavigationLink {
                if post.url != nil {
                    Webview(url: URL(string: post.url!)!)
                        .navigationBarTitle(post.storyTitle ?? post.title ?? "", displayMode: .inline)
                }
            } label: {
                Post(post: post)
            }
            .swipeActions(edge: .trailing) {
                Button(role: .destructive, action: {
                    model.deletePost(post: post)
                }, label: {
                    Label("Delete", systemImage: "trash.fill")
                })
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
