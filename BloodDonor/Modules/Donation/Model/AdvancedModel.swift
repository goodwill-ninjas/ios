import Foundation

struct AdvancedModel {
    let hand: [String]
    var selectedHand: Int
    var pressure: String
    var hemoglobin: String
    var others: String
    
    init() {
        hand = ["Lewa", "Prawa"]
        selectedHand = 0
        pressure = ""
        hemoglobin = ""
        others = ""
    }
}
