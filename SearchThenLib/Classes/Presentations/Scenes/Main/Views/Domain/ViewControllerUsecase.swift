//
//  ViewControllerUsecase.swift
//  SearchThenLib
//
//  Created by Jilay-PC on 9/14/18.
//  Copyright © 2018 Pich. All rights reserved.
//

import Foundation
import RxSwift

final class ViewControllerUsecase {
    private let api: FetchRepositoryAPIRepository = FetchRepositoryAPIRepository()
    
}

extension ViewControllerUsecase {
    func fetchRepository(query: String) -> Observable<[GithubRepositoryModel]> {
        return self.api.fetchRepository(query: query)
    }
}

