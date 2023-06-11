import Foundation

struct LoginBody: Codable {
    let email: String
    let password: String
}

struct RegisterBody: Codable {
    let email: String
    let username: String
    let password: String
    let blood_type: String
    let gender: String
    let avatar_id: Int?
}
