//
//  HttpService.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 31/05/2023.
//

import Alamofire

// Define a protocol named HttpService.
protocol HttpService {
    var sessionManager: Session { get set }  // The session manager used to send the request.
    
    // Function to send a request using a URLRequestConvertible object and return a DataRequest.
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest
}
