import Foundation

struct DonationModel {
    var donationId: Int
    let bloodTypes: [String]
    var bloodTypeIndex: Int
    var donationDate: Date
    var bloodAmount: Int
    var centerName: String
    
    let bloodAmounts = Array(stride(from: 50, through: 1000, by: 50))
    
    init() {
        bloodTypes = ["Krew pełna", "Płytki krwi", "Osocze", "Krwinki czerwone", "Krwinki białe"]
        bloodTypeIndex = 0
        donationDate = Date()
        bloodAmount = 450
        centerName = "RCKiK Gdańsk"
    }

}
