//
//  FetchRepositoryAPIRepository.swift
//  SearchThenLib
//
//  Created by Jilay-PC on 9/14/18.
//  Copyright © 2018 Pich. All rights reserved.
//

import Foundation
import RxSwift

final class FetchRepositoryAPIRepository {
    private let dataStore: FetchRepositoryAPIDataStore = FetchRepositoryAPIDataStore()
}

extension FetchRepositoryAPIRepository {
    func fetchRepository(query: String) -> Observable<[GithubRepositoryModel]> {
        return self.dataStore.fetchRepository(query: query)
            .map {GithubRepositoryTranslator().translate(input: $0) }
    }
}
