//
//  APIClient.swift
//  SearchThenLib
//
//  Created by Jilay-PC on 9/14/18.
//  Copyright © 2018 Pich. All rights reserved.
//

import Foundation
import APIKit
import Himotoki
import Result
import RxSwift

struct APIClient {
    public static var configuration = URLSessionConfiguration.default
    
    static var session: Session {
        self.configuration.urlCache?.diskCapacity = 0
        self.configuration.urlCache?.memoryCapacity = 0
        
        return Session(adapter: URLSessionAdapter(configuration: configuration))
    }
    
    struct Fetch {
        static func get(query: String) -> Observable<APIClient.Fetch.ResponseFetchRepositoryDecode> {
            return Session.sendRequest(
                request: Fetch.GetFetchRepositoryRequest(query: query)
            )
        }
    }
}



