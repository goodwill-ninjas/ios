import Foundation

enum Endpoint {
    static let baseURL: String  = "https://api.pre.gwn.adamjurkiewicz.com"
    
    case register
    case login
    case bloodCenters
    case bloodCentersDetails
    case addDonation
    case userFeat
    case userDonations
    case getUser
    case getFeats
    
    func path() -> String {
        switch self {
        case .register:
            return "/api/auth/register"
        case .login:
            return "/api/auth/login"
        case .bloodCenters:
            return "/api/blood-centers"
        case .bloodCentersDetails:
            return "/api/blood-centers/{city}"
        case .addDonation:
            return "/api/donations"
        case .userFeat:
            return "/api/users/{id}/feats"
        case .userDonations:
            return "/api/users/{id}/donations"
        case .getUser:
            return "/api/users/{id}"
        case .getFeats:
            return "/api/feats"
        }
    }
    
    var absoluteURL: URL {
        URL(string: Endpoint.baseURL + self.path())!
    }
}
