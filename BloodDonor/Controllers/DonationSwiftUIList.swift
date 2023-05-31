//
//  DonationSwiftUIList.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 02/04/2023.
//

import SwiftUI

struct DonationSwiftUIList: View {
    var body: some View {
        HStack {

            VStack {
                Image("bloodDrop")
                    .renderingMode(.original)
                    .resizable()
                .aspectRatio(contentMode: .fit)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .font(.title)
            }
                

         
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .font(.title)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .font(.subheadline)
            }
        }

    }
}

struct DonationSwiftUIList_Previews: PreviewProvider {
    static var previews: some View {
        DonationSwiftUIList()
    }
}
