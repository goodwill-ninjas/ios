import SwiftUI

struct DonationSwiftUIList: View {
    
    
    var body: some View {
        HStack {
            Image("bloodDrop")
                .renderingMode(.original)
                .resizable()
                .frame(width: 80, height: 80)
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                Text("Krew pełna")
                    .font(.title)
                Text("22/04/2023")
                    .font(.body)
            } .multilineTextAlignment(.leading)
            Text("450 ml")
                .font(.subheadline)
                .padding(40)
                .multilineTextAlignment(.trailing)
        }.padding()
    }
}

struct DonationSwiftUIList_Previews: PreviewProvider {
    static var previews: some View {
        DonationSwiftUIList()
    }
}
