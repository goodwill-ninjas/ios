import SwiftUI

struct AdvancedView: View {
    @State private var advancedModel = AdvancedModel()
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section(header: Text("Ciśnienie")) {
                        TextField("Ciśnienie", text: $advancedModel.pressure)
                    }
                    
                    Section(header: Text("Hemoglobina")) {
                        TextField("Hemoglobina", text: $advancedModel.hemoglobin)
                    }
                    
                    Section(header: Text("Inne")) {
                        TextEditor(text: $advancedModel.others)
                            .frame(height: 100)
                            .multilineTextAlignment(.leading)
                    }
                    
                    Section(header: Text("Ręka")) {
                        Picker("Ręka", selection: $advancedModel.selectedHand) {
                            ForEach(0..<advancedModel.hand.count) { index in
                                Text(advancedModel.hand[index])
                            }
                        }
                    }
                    
                    Button(action: {
                        // Wykonaj akcję związane z dodaniem zaawansowanych danych
                        // Możesz użyć advancedModel do pobrania wartości
                        
                        // Dismiss the view
                        dismiss()
                    }) {
                        Text("Dodaj")
                            .frame(width: 250, height: 50, alignment: .center)
                            .background(Color.green)
                            .foregroundColor(Color.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }
                .navigationBarTitle(Text("Zaawansowane"))
            }
        }
    }
    
    func dismiss() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}

struct AdvancedView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedView()
    }
}
