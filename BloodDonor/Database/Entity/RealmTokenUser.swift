//
//  DonationListItem.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 08/06/2023.
//
import Foundation
import RealmSwift
//// A Realm object representing a user token
class RealmTokenUser: Object {
    @objc dynamic var accessToken: String = "" // The access token associated with the user
    @objc dynamic var email: String = ""
    @objc dynamic var loggedIn: Bool = false
    @objc dynamic var updatedAt: Date = Date()
    // Override the primary key for the Realm object
    override class func primaryKey() -> String? {
        return "email"
    }
}

extension RealmTokenUser {
    
    // Convenience initializer to create a RealmTokenUser instance using a UserToken model object
    convenience init(usingModel model: UserToken) {
        self.init()
        self.accessToken = model.accessToken
        self.email = model.email
        self.loggedIn = model.loggedIn
    }
}

// Initialize a UserToken instance using a RealmTokenUser entity
extension UserToken {
    init(usingEnitity entity: RealmTokenUser) {
        self.accessToken = entity.accessToken
        self.email = entity.email
        self.loggedIn = entity.loggedIn
    }
}
