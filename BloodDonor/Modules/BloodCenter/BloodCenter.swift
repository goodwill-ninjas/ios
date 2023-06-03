//
//  BloodCenter.swift
//  BloodDonor
//
//  Created by Adam Jurkiewicz on 31/05/2023.
//

import Foundation
import Alamofire
import MapKit

struct BloodCenterBankDetails: Decodable {
    var bloodType: String
    var capacity: String
    var sourceDatetime: String
}

struct BloodCenters: Decodable, Identifiable {
    var id: Int
    var name: String
    var streetName: String
    var streetNumber: String
    var postalCode: String
    var city: String
    var voivodeship: String
    var geoCoordinates: String
    var phoneNumber: String
    var openFrom: String?
    var openTo: String?
    var bloodCenterDetails: [BloodCenterBankDetails]?

}

class BloodCenterDataService {
    var apiBaseUrl =  "https://api.pre.gwn.adamjurkiewicz.com"
    let apiToken: String
    let headers: HTTPHeaders
    
    init() {
        apiToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJibG9vZGRvbm9yIiwiY29udGV4dCI6eyJ1c2VyIjp7InVzZXJJZCI6MSwiZGlzcGxheU5hbWUiOiJhZGFtaiJ9fSwiaWF0IjoxNjg1NTUwNjI1LCJleHAiOjE2ODYxNTU0MjV9.eauTNijJm2fXBjvKZFY0A3tqdLTUwKnk0jcGqY7aqEg"
        headers = [
           .authorization(bearerToken: apiToken)
       ]
    }
    
    func fetchBloodCenterData() { // completion: @escaping (String) -> Void
        AF.request(apiBaseUrl + "/api/blood-centers", headers: headers)
            .response { response in
            guard let data = response.data else { return }
//            debugPrint(response)
//
//            switch response.result {
//            case .success(let data):
//                completion(response.data)
//
//            case .failure(let error):
//                completion(.failure(error))
//
//            default:
//                fatalError()
//            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode([BloodCenters].self, from: data)
                debugPrint(result)
            } catch let error {
                debugPrint("\(error)")
            }
            
            
        }
    }
    
    func fetchBloodCenterBankDetails(city: String) {
        AF.request(apiBaseUrl + "/api/blood-centers/" + city, headers: headers)
            .response { response in
                guard let data = response.data else { return }
                let json = String(data: data, encoding: String.Encoding.utf8)
                debugPrint(json)
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let result = try decoder.decode(BloodCenters.self, from: data)
                    if let bloodCenterDetails = result.bloodCenterDetails {
                        // Access and use the bloodCenterDetails array here
                        debugPrint(bloodCenterDetails)
                    }
                } catch let error {
                    debugPrint("\(error)")
                }
            }
    }

}

extension BloodCenterBankDetails {
    static let sampleBankDetails: [BloodCenterBankDetails] = [
        BloodCenterBankDetails(bloodType: "AB Rh+", capacity: "OPTIMAL", sourceDatetime: "2023-05-24T13:15:00.000Z"),
        BloodCenterBankDetails(bloodType: "AB Rh-", capacity: "CRITICAL", sourceDatetime: "2023-05-24T13:15:00.000Z"),
        BloodCenterBankDetails(bloodType: "B Rh+", capacity: "MODERATE", sourceDatetime: "2023-05-24T13:15:00.000Z"),
        BloodCenterBankDetails(bloodType: "B Rh-", capacity: "CRITICAL", sourceDatetime: "2023-05-24T13:15:00.000Z"),
        BloodCenterBankDetails(bloodType: "A Rh+", capacity: "OPTIMAL", sourceDatetime: "2023-05-24T13:15:00.000Z"),
        BloodCenterBankDetails(bloodType: "A Rh-", capacity: "CRITICAL", sourceDatetime: "2023-05-24T13:15:00.000Z"),
        BloodCenterBankDetails(bloodType: "0 Rh+", capacity: "CRITICAL", sourceDatetime: "2023-05-24T13:15:00.000Z"),
        BloodCenterBankDetails(bloodType: "0 Rh-", capacity: "CRITICAL", sourceDatetime: "2023-05-24T13:15:00.000Z")
    ]
}

extension BloodCenters {
        static let sampleCenters: [BloodCenters] =
    [
        BloodCenters(
            id: 1, name: "RCKiK w Białymstoku", streetName: "Marii Skłodowskiej-Curie", streetNumber: "23", postalCode: "15-950", city: "Białystok", voivodeship: "Podlaskie", geoCoordinates: "53.125720409018264, 23.162663039973207", phoneNumber: "(85) 744 70 02", openFrom: "nil", openTo: nil
        ),
        BloodCenters(
            id: 2, name: "RCKiK w Bydgoszczy", streetName: "Ks. Markwarta", streetNumber: "8", postalCode: "85-015", city: "Bydgoszcz", voivodeship: "Kujawsko-Pomorskie", geoCoordinates: "53.12600197045282, 18.011513275085004", phoneNumber: "(85) 744 70 02", openFrom: nil, openTo: nil
        ),
        BloodCenters(
            id: 3, name: "RCKiK w Gdańsku", streetName: "J. Hoene-Wrońskiego", streetNumber: "4", postalCode: "80-210", city: "Gdańsk", voivodeship: "Pomorskie", geoCoordinates: "54.36571840625166, 18.62905187316372", phoneNumber: "(58) 520 40 20", openFrom: nil, openTo: nil
        )
    ]
}
