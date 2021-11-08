//
//  NewsDomain.swift
//  TechnicalTaskNews
//
//  Created by Jose Moffa on 11/6/21.
//

import Foundation

// MARK: - DomainPost
struct DomainPost: Identifiable, Hashable {
    var id: String

    let storyTitle: String?
    let title: String?
    let author: String
    let url: String?
    let createdAtI: Int
}
