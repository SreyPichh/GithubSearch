
//
//  RequestType.swift
//  SearchThenLib
//
//  Created by Jilay-PC on 9/14/18.
//  Copyright © 2018 Pich. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

protocol RequestType: APIKit.Request {}

extension RequestType {
    
    /// Base URL
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    /// Header
    var headerFields: [String : String] {
        return [
            "Accept": "application/json",
            "Accept-Encoding": "gzip"
        ]
    }
    
    func intercept(urlRequest: URLRequest) throws -> URLRequest {
        return urlRequest
    }
    
    func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        guard (200..<300).contains(urlResponse.statusCode) else {
            throw APIError(object: object)
        }
        return object
    }
    
}


// MARK: - JSON Decode
extension RequestType where Response: Himotoki.Decodable {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Self.Response {
        return try decodeValue(object)
    }
}
