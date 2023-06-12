import SwiftUI

struct AddDonationView: View {
    @EnvironmentObject var donationVM: DonationViewModel
    @State private var disqualified: Bool = false
    @State private var companionUserID: Int?
    @State private var donatedType: String = ""
    @State private var amount: Int = 450
    @State private var bloodPressure: String = ""
    @State private var hemoglobin: String = ""
    @State private var arm: String = ""
    @State private var details: String = ""
    @State private var donatedAt: String = ""
    @State private var disqualificationDays: Int = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Donation Details")) {
                    Toggle("Disqualified", isOn: $disqualified)
                    if disqualified {
                        TextField("Companion User ID", value: $companionUserID, format: .number)
                    }
                    TextField("Donated Type", text: $donatedType)
                    Stepper("Amount: \(amount)", value: $amount)
                    TextField("Blood Pressure", text: $bloodPressure)
                    TextField("Donated At", text: $donatedAt)

                }
                
                Section {
                    Button(action: addDonation) {
                        if donationVM.addDonationPending {
                            ProgressView()
                        } else {
                            Text("Add Donation")
                            addDonation()
                        }
                    }
                    .disabled(donationVM.addDonationPending)
                }
            }
            .navigationBarTitle("Add Donation")
        }
    }
    
    func addDonation() {
        donationVM.addDonation(
            user_id: UserDefaultsWorker.shared.getUserId() ?? 0,
            disqualified: disqualified,
            companion_user_id: companionUserID,
            donated_type: donatedType,
            amount: amount,
            blood_pressure: bloodPressure,
            hemoglobin: hemoglobin,
            arm: arm,
            details: details,
            donated_at: donatedAt,
            disqualification_days: disqualificationDays
        )
    }
}
