//
//  PostView.swift
//  TechnicalTaskNews
//
//  Created by Jose Moffa on 11/7/21.
//

import SwiftUI

struct Post: View {
    let title: String
    let author: String
    let date: String

    var body: some View {
        HStack(alignment: .top, spacing: 16.0) {
            VStack(alignment: .leading, spacing: 8.0) {
                Text(title).font(.headline)
                Text("\(author) - \(date)")
                        .font(.footnote)
                        .foregroundColor(.secondary)
            }
        }
                .padding()
    }
}

extension Post {
    init(post: DomainPost) {
        title = post.title ?? post.storyTitle ?? "No title"
        author = post.author

        let dateParsed: Date! = Date(timeIntervalSince1970: TimeInterval(post.createdAtI))
        date = dateParsed.timeAgoDisplay()
    }
}

// MARK: - Preview
struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        Post(post: DomainPost(
                id: "",
                storyTitle: "Story Title",
                title: "Title",
                author: "Jose Moffa",
                url: "https://www.google.com",
                createdAtI: 1636152795
        ))
                .previewLayout(.sizeThatFits)
    }
}
