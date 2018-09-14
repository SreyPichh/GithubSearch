//
//  FetchRepositoryRequest.swift
//  SearchThenLib
//
//  Created by Jilay-PC on 9/14/18.
//  Copyright © 2018 Pich. All rights reserved.
//

import Foundation
import Himotoki
import APIKit

extension APIClient.Fetch {
    
    struct GetFetchRepositoryRequest: RequestType {
        typealias Response = APIClient.Fetch.ResponseFetchRepositoryDecode
        let query: String
        var path: String {
            return "/search/repositories"
        }
        var method: HTTPMethod {
            return .get
        }
    }
    
    struct ResposeFetchRepositoryDecode: Himotoki.Decodable {
        let items: [ResponseFetchRespositoryItems]
        static func decode(_ e: Extractor) throws -> APIClient.Fetch.ResposeFetchRepositoryDecode {
            return try ResposeFetchRepositoryDecode(
            items: e <|| "items"
            )
        }
    }
    struct ResponseFetchRepositoryItems: Himotoki.Decodable {
        let id: Int
        let name: String
        let fullName: String
        let htmlUrl: String
        
        static func decode(_ e: Extractor) throws -> APIClient.Fetch.ResponseFetchRepositoryItems {
            return try ResponseFetchRepositoryItems(id: e<| "id", name: e<| "name", fullName: e<| "full_name", htmlUrl: e<| "html_url")
        }
    }
}
