//
//  CacheManager.swift
//  FacebookFriends
//
//  Created by Sinan Ulusoy on 2.04.2023.
//

import Foundation
import RealmSwift

final class CacheManager {
    
    private let database: Realm
    static let shared = CacheManager()
    
    private init() {
        do {
            database = try Realm()
        }
        catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func save<T: Object>(object: T,
        _ errorHandler: @escaping ((_ error: Error) -> ()) = {_ in return}) {
        do {
            try database.write {
                database.add(object)
            }
        }
        catch {
            errorHandler(error)
        }
    }
    
    func fetch<T: Object>(object: T) -> Results<T> {
        return database.objects(T.self)
    }
    
    func delete<T: Object>(object: T,
        _ errorHandler: @escaping ((_ error: Error) -> ()) = {_ in return}) {
        do {
            try database.write {
                database.delete(object)
            }
        }
        catch {
            errorHandler(error)
        }
    }
    
    func deleteAll(_ errorHandler: @escaping ((_ error: Error) -> ()) = {_ in return}) {
        do {
            try database.write {
                database.deleteAll()
            }
        }
        catch {
            errorHandler(error)
        }
    }
}
