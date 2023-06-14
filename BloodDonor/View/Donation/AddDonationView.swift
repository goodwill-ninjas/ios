import SwiftUI

struct AddDonationView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var donationVM: DonationViewModel
    @State private var disqualified: Bool = false
    @State private var companionUserID: Int?
    @State private var donatedType: String = "whole"
    @State private var amount: Int = 450
    @State private var bloodPressure: String?
    @State private var hemoglobin: Int?
    @State private var arm: String?
    @State private var details: String?
    @State private var donatedAt: String = ""
    @State private var selectedDate: Date = Date()
    @State private var disqualificationDays: Int = 0
    @State var isShowingAdvancedForm = false
    @State private var isButtonPressed = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Szczegóły donacji")) {
                    Picker("Typ donacji", selection: $donatedType) {
                        Text("Krew Pełna").tag("whole")
                        Text("Osocze").tag("plasma")
                        Text("Płytki Krwi").tag("platelet")
                        Text("Krwinki Czerwone").tag("power")
                    }
                    .pickerStyle(.menu)
                    Stepper("Ilość krwi: \(amount) ml", value: $amount, step: 50)
                    DatePicker("Donation Date", selection: $selectedDate, displayedComponents: [.date])
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                        .onChange(of: selectedDate) { newValue in
                            let formatter = DateFormatter()
                            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SS'Z'"
                            donatedAt = formatter.string(from: newValue)
                        }
                }
                Section{
                    Button(action: {
                        self.isShowingAdvancedForm.toggle()
                    }) {
                        Text("Dodatkowe informacje")
                            .foregroundColor(.red)
                            .underline()
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                .sheet(isPresented: $isShowingAdvancedForm) {
                    DetailDonationView(addDonationAction: { bloodPressure, hemoglobin, arm, details in
                        self.bloodPressure = bloodPressure
                        self.hemoglobin = hemoglobin
                        self.arm = arm
                        self.details = details
                    })
                }
                Section {
                    Button(action: addDonation) {
                        if donationVM.addDonationPending {
                            ProgressView()
                        } else {
                            Text("Dodaj")
                        }
                    }
                    .disabled(donationVM.addDonationPending)
                    .frame(maxWidth: .infinity, minHeight: 50, alignment: .center)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(8)
                }
            }
            .navigationBarTitle("Nowa donacja")
        }
    }
    
    func dismissView() {
        presentationMode.wrappedValue.dismiss()
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
        dismissView()
    }
}
