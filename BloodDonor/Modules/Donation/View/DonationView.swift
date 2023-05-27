import SwiftUI

struct DonationView: View {
    @State private var donationModel = DonationModel()
    @State private var advancedModel = AdvancedModel()
    @State private var isShowingAdvancedForm = false
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section(header: Text("Centrum Krwiodawstwa")){
                        TextField("Nazwa Centrum", text: $donationModel.centerName)
                    }
                }
            }
        }
    }
}
        //        VStack {
        //            NavigationView {
        //                Form {
        //                    Section(header: Text("Nowa donacja")) {
        //                        Picker(selection: donationModel.bloodTypeIndex, label: Text("Typ donacji")) {
        //                            ForEach(0 ..< donationModel.bloodTypes.count) { index in
        //                                Text(donationModel.bloodTypes[index]).tag(index)
        //                            }
        //                        } label: {
        //                            Text("Typ donacji")
        //                        }
        //                        .pickerStyle(.menu)
        //
        //                        DatePicker("Data donacji", selection: donationModel.donationDate, displayedComponents: .date)
        //
        //                        Picker(selection: donationModel.bloodAmount, label: Text("Ilość krwi")) {
        //                            ForEach(donationModel.bloodAmounts, id: \.self) { amount in
        //                                Text("\(amount) ml")
        //                            }
        //                        } label: {
        //                            Text("Ilość krwi")
        //                        }
        //                    }
        //
        //
        //                    Section(header: Text("Centrum Krwiodawstwa")){
        //                        TextField("Nazwa Centrum", text: donationModel.centerName)
        //                    }
        //
        //                    Section {
        //                        Button(action: {
        //                            self.isShowingAdvancedForm.toggle()
        //                        }) {
        //                            Text("Zaawansowane")
        //                                .foregroundColor(.red)
        //                                .underline()
        //                                .frame(maxWidth: .infinity, alignment: .center)
        //                        }
        //                    }
        //                    .sheet(isPresented: $isShowingAdvancedForm) {
        ////                        AdvancedView(advancedModel: $advancedModel)
        //                    }
        //
        //                    Button(action: {
        //                        // Obsługa logiki dodawania donacji
        //
        //                        // Przykład użycia modelu:
        ////                        print("Typ donacji: \(donationModel.bloodTypes[donationModel.bloodTypeIndex])")
        ////                        print("Data donacji: \(donationModel.donationDate)")
        ////                        print("Ilość krwi: \(donationModel.bloodAmount)")
        ////                        print("Nazwa Centrum: \(donationModel.centerName)")
        //                    }) {
        //                        Text("Dodaj")
        //                            .frame(width: 250, height: 50, alignment: .center)
        //                            .background(Color.green)
        //                            .foregroundColor(Color.white)
        //                            .cornerRadius(8)
        //                    }
        //                    .padding()
        //                }
        //                .navigationBarTitle(Text("Dodaj donację"))
        //            }
        //        }
        //    }
        //}
    
struct DonationView_Previews: PreviewProvider {
    static var previews: some View {
        DonationView()
    }
}
