import SwiftUI

struct DisqualificationFormSwiftUIView: View {
    @State private var disqualificationDate = Date()
    @State private var nextDonationDate = Date()
   
    @State var isShowingAdvancedForm = false // dodajemy stan, aby przechowywać informację o tym, czy widok "AdvancedFormSwiftUI" jest widoczny
    
    
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section (header: Text("Dodaj dyskwalifikację")){
                        DatePicker("Data dyskwalifiakcji", selection: $disqualificationDate, displayedComponents: .date)
                        DatePicker("Koniec dyskwalifikacji", selection: $nextDonationDate, displayedComponents: .date)
                        
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
                        AdvancedFormSwiftUIViewController() // jeśli stan "isShowingAdvancedForm" ulegnie zmianie na "true", wyświetlamy widok "AdvancedFormSwiftUI"
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
                .navigationBarTitle(Text("Dyskwalifikacja"))
            }
        }
    }
}

struct disqualificationFormSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DisqualificationFormSwiftUIView()
    }
}
