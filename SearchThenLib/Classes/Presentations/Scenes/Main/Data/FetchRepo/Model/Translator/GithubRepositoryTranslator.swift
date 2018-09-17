//
//  GithubRepositoryTranslator.swift
//  SearchThenLib
//
//  Created by Jilay-PC on 9/14/18.
//  Copyright © 2018 Pich. All rights reserved.
//

import Foundation

struct GithubRepositoryTranslator {
    
    typealias input = APIClient.Fetch.ResponseFetchRepositoryDecode
    typealias output = [GithubRepositoryModel]
    
    func translate(input: APIClient.Fetch.ResponseFetchRepositoryDecode) -> [GithubRepositoryModel] {
        var repositories: [GithubRepositoryModel] = []
        input.items.forEach { (repo) in
            let item = GithubRepositoryModel(
                id: repo.id,
                name: repo.name,
                fullName: repo.fullName,
                htmlUrl: repo.htmlUrl
            )
            repositories.append(item)
        }
        return repositories
    }
    
}
