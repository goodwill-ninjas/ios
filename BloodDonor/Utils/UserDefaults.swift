import Foundation

class UserDefaultsWorker {
    
    static let shared = UserDefaultsWorker()

    private static let KEY_ACCESS_TOKEN = "token"
    private static let KEY_USER_ID = "userId"
    private static let KEY_DISPLAY_NAME = "displayName"

    
    func saveAuthTokens(tokens: TokensInfo, userId: Int, displayName: String) {
        let defaults = UserDefaults.standard
        defaults.set(tokens.token, forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN)
        defaults.set(userId, forKey: UserDefaultsWorker.KEY_USER_ID)
        defaults.set(displayName, forKey: UserDefaultsWorker.KEY_DISPLAY_NAME)
    }
    
    func getAccessToken() -> TokenInfo {
        let defaults = UserDefaults.standard
        let token = defaults.object(forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN) as? String ?? ""
        return TokenInfo(token: token)
    }
    
    func getUserId() -> Int? {
        let defaults = UserDefaults.standard
        let userId = defaults.object(forKey: "userId") as? Int
        return userId
    }
    
    func getDisplayName() -> Int? {
        let defaults = UserDefaults.standard
        let displayName = defaults.object(forKey: "displayName") as? Int
        return displayName
    }
    
    
    func haveAuthTokens() -> Bool {
        return !getAccessToken().token.isEmpty
    }
    
    func dropTokens() {
        UserDefaults.standard.set("", forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN)
        UserDefaults.standard.set("-1", forKey: UserDefaultsWorker.KEY_USER_ID)
        UserDefaults.standard.set("", forKey: UserDefaultsWorker.KEY_DISPLAY_NAME)
    }
    
    let isLoggedIn: () -> Bool = {
        return UserDefaultsWorker.shared.getAccessToken().token != ""
    }
}
