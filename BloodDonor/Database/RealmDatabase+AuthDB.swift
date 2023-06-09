//
//  RealmDatabase+AuthDB.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 08/06/2023.
//
import RealmSwift

// Extension of RealmDatabase conforming to AuthDB protocol

extension RealmDatabase: AuthDB {
    
    func saveToken(userToken: UserToken) -> Bool {
        let realm = try! Realm()
        do {
            try realm.write {
                realm.add(RealmTokenUser(usingModel: userToken), update: .all)
            }
        } catch {
            print("Error on saving token: \(error)")
            return false
        }
        return true
    }
    
    func saveUser(usingUser user: User) -> Bool {
        let realm = try! Realm()
        do {
            try realm.write {
                realm.add(RealmUser(usingModel: user), update: .all)
            }
        } catch {
            print("Error on saving token: \(error)")
            return false
        }
        return true
    }
}
