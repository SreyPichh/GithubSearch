//
//  FetchRepositoryAPIDataStore.swift
//  SearchThenLib
//
//  Created by Jilay-PC on 9/14/18.
//  Copyright © 2018 Pich. All rights reserved.
//

import Foundation
import RxSwift

final class FetchRepositoryAPIDataStore {}

extension FetchRepositoryAPIDataStore {
    func fetchRepository(query: String) -> Observable<APIClient.Fetch.ResponseFetchRepositoryDecode> {
        return APIClient.Fetch.get(query: query)
    }
}
