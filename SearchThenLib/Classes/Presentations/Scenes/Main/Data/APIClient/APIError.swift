//
//  APIError.swift
//  SearchThenLib
//
//  Created by Jilay-PC on 9/14/18.
//  Copyright © 2018 Pich. All rights reserved.
//

import Foundation
import APIKit

struct APIError: Error {
    typealias Response = [String: Any]
    
    let statusCode = Int
    let message: String
    
    init(object: Any) {
        let dictionary = object as? Response
        statusCode = dictionary?["status"] as? Int ?? 999
        message = dictionary?["message"] as? String ?? "Unknown Error occured"
        
    }
    
}
