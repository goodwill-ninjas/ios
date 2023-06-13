import Foundation

enum BloodTypeTranslation: String {
    case whole = "Krew Pełna"
    case plasma = "Osocze"
    case platelet = "Płytki Krwi"
    case power = "Krwinki Czerwone"
    
    var translatedValue: String {
        return rawValue
    }
    
    static func translateBloodType(type: String) -> String {
        if let bloodType = BloodTypeTranslation(rawValue: type) {
            return bloodType.translatedValue
        } else {
            return "Krew"
        }
    }
}

enum ArmConjugation: String {
    case left = "lewa"
    case right = "prawa"
    
    func conjugateArm() -> String {
        return self.rawValue
    }
}
