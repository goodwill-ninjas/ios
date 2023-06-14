//
//  AddDisqualificationView.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 11/06/2023.
//

import SwiftUI

struct AddDisqualificationView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var donationVM: DonationViewModel
    @State private var disqualified: Bool = true
    @State private var companionUserID: Int?
    @State private var donatedType: String = "whole"
    @State private var amount: Int = 450
    @State private var bloodPressure: String?
    @State private var hemoglobin: Int?
    @State private var arm: String?
    @State private var details: String?
    @State private var donatedAt: String = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SS'Z'"
        return formatter.string(from: Date())
    }()
    @State private var selectedDate: Date = Date()
    @State private var disqualification_days: Int = 14
    @State var isShowingAdvancedForm = false
    @State private var isButtonPressed = false
    
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section (header: Text("Dodaj dyskwalifikację")){
                        DatePicker("Donation Date", selection: $selectedDate, displayedComponents: [.date])
                            .datePickerStyle(.wheel)
                            .labelsHidden()
                            .onChange(of: selectedDate) { newValue in
                                let formatter = DateFormatter()
                                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SS'Z'"
                                donatedAt = formatter.string(from: newValue)
                            }

                        Picker(selection: $disqualification_days, label: Text("Liczba dni")) {
                            ForEach(1...30, id: \.self) { amount in
                                if amount == 1 {
                                    Text("\(amount) dzień")
                                } else {
                                    Text("\(amount) dni")
                                }
                            }
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
                    .navigationBarTitle(Text("Dyskwalifikacja"))
                }
            }
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
            disqualification_days: disqualification_days
        )
        dismissView()
    }
}
