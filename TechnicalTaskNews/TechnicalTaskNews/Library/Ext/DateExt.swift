//
//  DateExt.swift.swift
//  TechnicalTaskNews
//
//  Created by Jose Moffa on 11/6/21.
//

import Foundation

extension Date {

    /// Format the Date into a time relative string
    /// - Returns: Time relative string, e.g., "2 days ago"
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
