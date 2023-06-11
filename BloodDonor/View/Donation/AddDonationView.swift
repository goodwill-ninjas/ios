
import SwiftUI

struct AddDonationView: View {
//    @StateObject private var donationViewModel = DonationViewModel()
    @State private var bloodTypeIndex = 0
    @State private var donationDate = Date()
    @State private var bloodAmount = 450
    @State private var centerName = "RCKiK Gdańsk"
    @State var isShowingAdvancedForm = false // dodajemy stan, aby przechowywać informację o tym, czy widok "AdvancedFormSwiftUI" jest widoczny
    
    let bloodTypes = ["Krew pełna", "Płytki krwi", "Osocze", "Krwinki czerwone", "Krwinki białe"]
    let bloodAmounts = Array(stride(from: 50, through: 1000, by: 50))
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section (header: Text("Nowa donacja")){
                        Picker("Typ donacji", selection: $bloodTypeIndex) {
                            ForEach(0 ..< bloodTypes.count){
                                Text(self.bloodTypes[$0]).tag($0)
                            }
                        }.pickerStyle(.menu)
                        DatePicker("Data donacji", selection: $donationDate, displayedComponents: .date)
                        Picker(selection: $bloodAmount, label: Text("Ilość krwi")) {
                            ForEach(bloodAmounts, id: \.self) { amount in
                                Text("\(amount) ml")}
                        }
                    }
                    
                    Section(header: Text("Centrum Krwiodawstwa")){
                        TextField("Nazwa Centrum", text: $centerName)
                        
                    }
                    Section{
                        Button(action: {
                            self.isShowingAdvancedForm.toggle() // po kliknięciu przycisku "Zaawansowane" zmieniamy stan "isShowingAdvancedForm"
                        }) {
                            Text("Zaawansowane")
                                .foregroundColor(.red)
                                .underline()
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                    .sheet(isPresented: $isShowingAdvancedForm) {
                        DetailDonationView() // jeśli stan "isShowingAdvancedForm" ulegnie zmianie na "true", wyświetlamy widok "AdvancedFormSwiftUI"
                    }
                    Button(action: {
                        
                    }, label: {
                        Text("Dodaj")
                            .frame(width: 250, height: 50, alignment: .center)
                            .background(Color.green)
                            .foregroundColor(Color.white)
                            .cornerRadius(8)
                    })
                    .padding()
                }
                .navigationBarTitle(Text("Dodaj donację"))
            }
        }
    }
}

struct AddDonationView_Previews: PreviewProvider {
    static var previews: some View {
        AddDonationView()
    }
}
