import Foundation

struct TokensInfo: Codable {
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case token = "token"

    }
}
