import SwiftUI

struct DetailDonation: View {
    @State private var bloodTypeIndex = 0
    @State private var donationDate = Date()
    @State private var bloodAmount = 450
    @State private var pressureName = "0:0"
    @State private var hemoglobin = ""
    @State private var others = ""
    @State private var handsIndex = 0
    @State var isShowingAdvancedForm = false // dodajemy stan, aby przechowywać informację o tym, czy widok "AdvancedFormSwiftUI" jest widoczny
    
    let bloodTypes = ["Krew pełna", "Płytki krwi", "Osocze", "Krwinki czerwone", "Krwinki białe"]
    let bloodAmounts = Array(stride(from: 50, through: 1000, by: 50))
    let hand = ["Lewa", "Prawa"]
    
    
    func dismiss() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section(header: Text("Ciśnienie")){
                        TextField("Ciśnienie", text: $pressureName)
                    }
                    Section(header: Text("Hemoglobina")){
                        TextField("Hemoglobina", text: $hemoglobin)
                    }
                    Section(header: Text("Inne")){
                        TextEditor(text: $others)
                            .frame(height: 100)
                            .multilineTextAlignment(.leading)
                    }
                    Section(header: Text("Ręka")){
                        Picker("Ręka", selection: $handsIndex) {
                            ForEach(0 ..< hand.count){
                                Text(self.hand[$0]).tag($0)
                            }
                        }.pickerStyle(.segmented)
                    }
                    
                    
                    Button(action: {
                        self.dismiss()
                    }, label: {
                        Text("Powrót")
                            .frame(width: 250, height: 50, alignment: .center)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(8)
                    })
                    .padding()
                }
                .navigationBarTitle(Text("Krew pełna"))
            }
        }
    }
}


struct DetailDonation_Previews: PreviewProvider {
    static var previews: some View {
        DetailDonation()
    }
}
