//
//  HTTPRouter.swift
//  BloodDonor
//
//  Created by Łukasz Cettler on 31/05/2023.
//

import Alamofire
import SwiftUI

// Define a protocol named HttpRouter that conforms to URLRequestConvertible.
protocol HttpRouter: URLRequestConvertible {
    var baseUrlString: String { get }  // The base URL string for the request.
    var path: String { get }  // The path component of the URL.
    var method: HTTPMethod { get }  // The HTTP method for the request.
    var headers: HTTPHeaders? { get }  // Optional HTTP headers for the request.
    var parameters: Parameters? { get }  // Optional parameters for the request.
    
    // Function to get the request body as Data.
    func body() throws -> Data?
    
    // Function to create a URLRequest object.
    func asURLRequest() throws -> URLRequest
    
    // Function to make a data request using an HttpService object.
    func request(usingHttpService service: HttpService) throws -> DataRequest
}

// Extend the HttpRouter protocol with default implementations of some properties and functions.
extension HttpRouter {
    var parameters: Parameters? { return nil }  // Default implementation returns nil for parameters.
    
    // Default implementation returns nil for the request body.
    func body() throws -> Data? { return nil }
    
    // Default implementation to create a URLRequest object.
    func asURLRequest() throws -> URLRequest {
        var url = try baseUrlString.asURL()  // Convert the base URL string to a URL object.
        url.appendPathComponent(path)  // Append the path component to the URL.
        
        var request = try URLRequest(url: url, method: method, headers: headers)  // Create the URLRequest object.
        request.httpBody = try body()  // Set the request body.
        return request
    }
    
    // Default implementation to make a data request using an HttpService object.
    func request(usingHttpService service: HttpService) throws -> DataRequest {
        return try service.request(asURLRequest())  // Make the data request using the HttpService object.
    }
}
