import SwiftUI

struct AddDisqualification: View {
    @State private var disqualificationDate = Date()
    @State private var nextDonationDate = 14
    
    @State var isShowingAdvancedForm = false
    
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section (header: Text("Dodaj dyskwalifikację")){
                        DatePicker("Data dyskwalifiakcji", selection: $disqualificationDate, displayedComponents: .date)
                        Picker(selection: $nextDonationDate, label: Text("Liczba dni")) {
                            ForEach(1...30, id: \.self) { amount in  // Range from 1 to 30
                                if amount == 1 {
                                    Text("\(amount) dzień")
                                } else {
                                    Text("\(amount) dni")
                                }
                            }
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
}

struct disqualificationFormSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddDisqualification()
    }
}
