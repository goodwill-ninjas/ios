import Foundation
import SwiftUI
import JWTDecode

func decodeJWTforUserID(jwtToken: String) -> Int? {
    do {
        let jwt = try decode(jwt: jwtToken)
        if let context = jwt.body["context"] as? [String: Any],
           let user = context["user"] as? [String: Any],
           let userId = user["userId"] as? Int {
            return userId
        }
    } catch {
        // Handle the error thrown by the decode function
        print("JWT decoding error: \(error)")
        // Show an error message or handle the error appropriately
    }
    return nil
}

func extractDisplayNameFromJWT(jwtToken: String) -> String? {
    do {
        let jwt = try decode(jwt: jwtToken)
        if let context = jwt.body["context"] as? [String: Any],
           let user = context["user"] as? [String: Any],
           let displayName = user["displayName"] as? String {
            return displayName
        }
    } catch {
        // Handle the error thrown by the decode function
        print("JWT decoding error: \(error)")
        // Show an error message or handle the error appropriately
    }
    return nil
}
