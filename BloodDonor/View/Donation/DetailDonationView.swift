//
//  DetailDonationVIew.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 11/06/2023.
//

import SwiftUI

struct DetailDonationView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var bloodPressure: String = "120/80"
    @State private var hemoglobin: Int = 0
    @State private var arm: String = ""
    @State private var details: String = ""
    @State var isShowingAdvancedForm = false
    @State private var showAlert = false
    
    var addDonationAction: ((String?, Int?, String?, String?) -> Void)?
    
    private func validateInput() -> Bool {
        let regexPattern = #"^\d{1,3}/\d{1,3}$"#
        do {
            let regex = try NSRegularExpression(pattern: regexPattern, options: [])
            let range = NSRange(location: 0, length: bloodPressure.utf16.count)
            return regex.firstMatch(in: bloodPressure, options: [], range: range) != nil
        } catch {
            print("Invalid regular expression: \(error)")
            return false
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Ciśnienie")) {
                    HStack{
                        TextField("Ciśnienie", text: $bloodPressure)
                            .alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text("Nieprawidłowe dane"),
                                    message: Text("Ciśnienie krwi musi mieć format 'X/Y', gdzie X i Y są liczbami o maksymalnej długości 3 miejsc."),
                                    dismissButton: .default(Text("OK"))
                                )
                            }
                        Text("mm Hg")
                    }
                }
                Section(header: Text("Hemoglobina")) {
                    HStack{
                        TextField("Hemoglobina", text: Binding<String>(
                            get: { String(hemoglobin) },
                            set: { if let value = Int($0) { hemoglobin = value } }
                        ))
                        Text("g/l")
                    }
                }
                Section(header: Text("Podaj wynik badania")) {
                    TextEditor(text: $details)
                        .frame(height: 100)
                        .multilineTextAlignment(.leading)
                }
                Section(header: Text("Ręka")) {
                    Picker(selection: $arm, label: Text("Ręka")) {
                        Text("Lewa").tag("left")
                        Text("Prawa").tag("right")
                    }
                    .pickerStyle(.segmented)
                }
                Button(action: {
                    if validateInput() {
                        addDonationAction?(bloodPressure, hemoglobin, arm, details)
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        showAlert = true
                    }
                }) {
                    Text("Zapisz")
                }
                .frame(maxWidth: .infinity, minHeight: 50, alignment: .center)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(8)
            }
            .navigationBarTitle(Text("Dodatkowe informacje"))
        }
    }
}
