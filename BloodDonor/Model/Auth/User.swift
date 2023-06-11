import Foundation

struct User: Codable {
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
    }
    
    func getTokensInfo() -> TokensInfo {
        return TokensInfo(token: token)
    }
}
