import Foundation

class BloodTypeTranslator {
    static func translateBloodType(type: String) -> String {
        switch type {
        case "whole":
            return "Krew Pełna"
        case "plasma":
            return "Osocze"
        case "platelet":
            return "Płytki Krwi"
        case "power":
            return "Krwinki Czerwone"
        default:
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
