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
    
    init(user_id: Int, disqualified: Bool?, companion_user_id: Int?, donated_type: String?, amount: Int?, blood_pressure: String?, hemoglobin: String?, arm: String?, details: String?, donated_at: String?, disqualification_days: Int?) {
        self.user_id = user_id
        self.disqualified = disqualified
        self.companion_user_id = companion_user_id
        self.donated_type = donated_type
        self.amount = amount
        self.blood_pressure = blood_pressure
        self.hemoglobin = hemoglobin
        self.arm = arm
        self.details = details
        self.donated_at = donated_at
        self.disqualification_days = disqualification_days
    }
    
    static func createFromUser(user: User, disqualified: Bool?, companion_user_id: Int?, donated_type: String?, amount: Int?, blood_pressure: String?, hemoglobin: String?, arm: String?, details: String?, donated_at: String?, disqualification_days: Int?) -> AddDonation? {
        guard let userId = UserDefaultsWorker.shared.getUserId() else {
            print("User ID not available")
            return nil
        }
        
        return AddDonation(user_id: userId, disqualified: disqualified, companion_user_id: companion_user_id, donated_type: donated_type, amount: amount, blood_pressure: blood_pressure, hemoglobin: hemoglobin, arm: arm, details: details, donated_at: donated_at, disqualification_days: disqualification_days)
    }
}
