//
//  RealmUser.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 08/06/2023.
//
import RealmSwift
import Foundation

class RealmUser: Object {
    @objc dynamic var id: Int = 0 // Represents the unique identifier for the user.
    @objc dynamic var name: String = "" //same
    @objc dynamic var email: String = "" //same
    
    override class func primaryKey() -> String? {
        return "email" // Specifies the primary key for the RealmUser class as the "email" property.
    }
}

extension RealmUser {
    // Convenience initializer to create a RealmUser instance using a User model object.
    // Convenience initializer is a secondary initializer in a class or structure that provides an alternative way to create an instance.
    convenience init(usingModel model: User) {
        self.init()
        self.name = model.username // Assigns the username from the User model to the name property of RealmUser.
        self.email = model.email //same
    }
}

extension User {
    init(usingEnitity entity: RealmUser) {
        self.id = entity.id // Initializes a User instance using a RealmUser entity object, assigning the id property.
        self.username = entity.name // Assigns the name property from the RealmUser entity to the username property of User.
        self.email = entity.email //same
    }
}

