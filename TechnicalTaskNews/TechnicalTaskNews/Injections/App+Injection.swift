//
//  App+Injection.swift
//  TechnicalTaskNews
//
//  Created by Jose Moffa on 11/7/21.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register {
            RepositoryPost()
        }
        register {
            NewsViewModel()
        }
        register {
            PersistenceController.shared.container.viewContext
        }
    }
}
