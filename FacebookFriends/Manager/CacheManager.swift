//
//  CacheManager.swift
//  FacebookFriends
//
//  Created by Sinan Ulusoy on 2.04.2023.
//

import Foundation
import RealmSwift

final class CacheManager {

    static let shared = CacheManager()
    private var database: Realm
    
    private init() {
        do {
            database = try Realm()
        }
        catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func isExist<T: Object>(type: T, id: String) -> Bool {
        let obj = database.objects(T.self).filter("id='\(id)'")
        return !obj.isEmpty
    }
    
    func getObjectById<T: Object>(type: T, id: String) -> Results<T>? {
        let obj = database.objects(T.self).filter("id='\(id)'")
        return !obj.isEmpty ? obj : nil
    }
    
    func save<T: Object>(object: T,
                         _ errorHandler: @escaping ((_ error: Error) -> ()) = {_ in return}) {
        do {
            try self.database.write {
                self.database.add(object)
            }
        }
        catch {
            errorHandler(error)
        }
    }
    
    func fetch<T: Object>(object: T) -> Results<T> {
        return database.objects(T.self)
    }
    
    func update<T: Object>(object: T,
                           _ errorHandler: @escaping ((_ error: Error) -> ()) = {_ in return}) {
        do {
            try database.write {
                database.add(object, update: .modified)
            }
        }
        catch {
            errorHandler(error)
        }
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
