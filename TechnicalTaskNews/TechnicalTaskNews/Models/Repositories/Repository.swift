//
//  Repository.swift
//  TechnicalTaskNews
//
//  Created by Jose Moffa on 11/6/21.
//

import Combine

protocol Repository {
    associatedtype Generic

    func get(id: Int, completionHandler: @escaping (Generic?, Error?) -> Void)
    func list(completionHandler: @escaping ([Generic]?, Error?) -> Void)
    func add(_ item: Generic, completionHandler: @escaping (Error?) -> Void)
    func delete(_ item: Generic, completionHandler: @escaping (Error?) -> Void)
    func edit(_ item: Generic, completionHandler: @escaping (Error?) -> Void)
}

protocol CombineRepository {
    associatedtype Generic

    func get(id: Int) -> AnyPublisher<Generic, Error>
    func list() -> AnyPublisher<[Generic], Error>
    func add(_ item: Generic) -> AnyPublisher<Void, Error>
    func delete(_ item: Generic) -> AnyPublisher<Void, Error>
    func edit(_ item: Generic) -> AnyPublisher<Void, Error>
}
