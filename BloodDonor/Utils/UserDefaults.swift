import Foundation

class UserDefaultsWorker {
    
    static let shared = UserDefaultsWorker()

    private static let KEY_ACCESS_TOKEN = "token"

    
    func saveAuthTokens(tokens: TokensInfo) {
        let defaults = UserDefaults.standard
        defaults.set(tokens.token, forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN)
    }
    
    func getAccessToken() -> TokenInfo {
        let defaults = UserDefaults.standard
        let token = defaults.object(forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN) as? String ?? ""
        return TokenInfo(token: token)
    }
    
    
    func haveAuthTokens() -> Bool {
        return !getAccessToken().token.isEmpty
    }
    
    func dropTokens() {
        let defaults = UserDefaults.standard
        defaults.set("", forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN)
    }
}
