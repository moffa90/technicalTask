//
//  NewsDomain.swift
//  TechnicalTaskNews
//
//  Created by Jose Moffa on 11/6/21.
//

import Foundation

// MARK: - DomainNews
struct DomainPost: Identifiable {
    var id: String
    
    let storyTitle: String?
    let title: String?
    let author: String
    let created_at_i: Int
}
