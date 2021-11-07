//
//  NewsView.swift
//  TechnicalTaskNews
//
//  Created by Jose Moffa on 11/6/21.
//

import SwiftUI
import Resolver

struct NewsView: View {

    @StateObject private var model: NewsViewModel = Resolver.resolve()

    var body: some View {
        List(model.postsList) { post in
            NavigationLink {
                Webview(url: URL(string: post.url ?? ""))
                        .navigationBarTitle(post.storyTitle ?? post.title ?? "", displayMode: .inline)
            } label: {
                Post(post: post)
            }
                    .disabled(post.url == nil)
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
