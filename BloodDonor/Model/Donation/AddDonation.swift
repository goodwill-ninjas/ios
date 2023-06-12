import Foundation

struct AddDonation: Codable {
    let user_id: Int
    let disqualified: Bool?
    let companion_user_id: Int?
    let donated_type: String?
    let amount: Int?
    let blood_pressure: String?
    let hemoglobin: String?
    let arm: String?
    let details: String?
    let donated_at: String?
    let disqualification_days: Int?
}
