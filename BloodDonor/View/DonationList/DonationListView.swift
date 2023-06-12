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
                    userDonation in VStack() {
                        if (userDonation.disqualified) {
                            Text("🚫 Dyskwalifikacja na \(userDonation.disqualification_days!) dni  ")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                            Text(trimDate(userDonation.donated_at))
                                .font(.caption2)
                                .italic()
                            
                            if (userDonation.details != nil) {
                                Text("\n\(userDonation.details!)")
                                    .font(.caption)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        } else {
                            Text("🩸 \(translateBloodType(type: userDonation.donated_type)) - \(userDonation.amount)ml")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                            Text(trimDate(userDonation.donated_at))
                                .font(.caption2)
                                .italic()
                            
                            if(userDonation.hemoglobin != nil ||
                               userDonation.blood_pressure != nil) {
                                Spacer()
                            }
                            
                            HStack() {
                                if (userDonation.hemoglobin != nil) {
                                    VStack() {
                                        Text("Poziom hemoglobiny")
                                            .font(.caption)
                                            .bold()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text("\(userDonation.hemoglobin!) g/l")
                                            .font(.caption)
                                            .italic()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                }
                                
                                if (userDonation.blood_pressure != nil) {
                                    VStack() {
                                        Text("Ciśnienie krwi")
                                            .font(.caption)
                                            .bold()
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                        
                                        Text("\(userDonation.blood_pressure!) mm Hg")
                                            .font(.caption)
                                            .italic()
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                    }
                                }
                            }
                            
                            if (userDonation.arm != nil) {
                                Spacer()
                                Text("Pobrano krew z \(conjugateArm(userDonation.details!)) ręki")
                                    .font(.caption)
                                    .italic()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            if (userDonation.details != nil) {
                                Text("\n\(userDonation.details!)")
                                    .font(.caption)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                }
                .onAppear() {
                    donationList.getUserDonations()
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
    
    func translateBloodType(type: String) -> String {
        switch type {
        case "whole":
            return "Krew Pełna"
        case "plasma":
            return "Osocze"
        case "platelet":
            return "Płytki Krwi"
        case "power":
            return "Krwinki Czerwone"
        default:
            return "Krew"
        }
    }
    
    let trimDate: (String) -> String = { date in
        return date.components(separatedBy: "T").first ?? ""
    }
    
    let conjugateArm: (String) -> String = { arm in
        return arm == "left" ? "lewej" : "prawej"
    }
}
