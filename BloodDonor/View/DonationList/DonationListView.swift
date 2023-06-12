//
//  DonationListView.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 11/06/2023.
//

import SwiftUI

struct DonationListView: View {
    @EnvironmentObject var donationList: DonationListViewModel
    
    var body: some View {
        VStack {
            switch donationList.loadingState {
            case .finished:
                List(donationList.userDonations, id: \.id) {
                    userDonation in HStack() {
                        Text("Donacyjka: ")
                        Text(String(userDonation.id)).font(.headline)
                        Text(userDonation.donated_type).font(.caption)
                        Text(String(userDonation.amount)).font(.caption)
                        Text(String(userDonation.disqualified)).font(.caption)
                    }
                }
            case .error:
                Spacer()
                Text("An error occurred while loading data")
                    .padding(.horizontal, 24)
                Button {
                    donationList.getUserDonations()
                } label: {
                    Text("Retry")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 50)
                        .background(Color.black)
                }
                .cornerRadius(10)
                .padding(.top, 16)
                .padding(.horizontal, 24)
                Spacer()
            case .notStarted, .loading:
                Spacer()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .scaleEffect(1.6)
                    .padding(.top, 26)
                Spacer()
            }
        }.navigationBarTitle("Dziennik Donacji", displayMode: .inline)
            .onAppear {
                if donationList.userDonations.isEmpty {
                    donationList.getUserDonations()
                }
            }
    }
}
