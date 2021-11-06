//
//  TechnicalTaskNewsApp.swift
//  TechnicalTaskNews
//
//  Created by Jose Moffa on 11/5/21.
//

import SwiftUI

@main
struct TechnicalTaskNewsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                NewsView()
            }
        }
    }
}
