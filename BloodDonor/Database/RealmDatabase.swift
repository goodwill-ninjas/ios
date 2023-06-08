//
//  RealmDatabase.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 08/06/2023.
//
// RealmDatabase is a singleton class responsible for managing the Realm database.
// A singleton class is a class that allows only a single instance of itself to be created and provides a global point of access to that instance throughout the application.
class RealmDatabase {
    // Shared instance of the RealmDatabase accessible throughout the app.
    static let shared : RealmDatabase = RealmDatabase()
    // Private initializer to prevent creating multiple instances of the class.
    private init() {}
}


