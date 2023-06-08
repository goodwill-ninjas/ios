//
//  AuthDB.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 08/06/2023.
//

import Foundation

protocol AuthDB {
    // Saves the user token to the authentication database
    // Returns true if the token is successfully saved, false otherwise
    func saveToken(userToken: UserToken) -> Bool
    // Saves the user to the authentication database
    // Returns true if the user is successfully saved, false otherwise
    func saveUser(usingUser user: User) -> Bool
}
