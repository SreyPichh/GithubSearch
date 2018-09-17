//
//  ViewControllerReactor.swift
//  SearchThenLib
//
//  Created by ken.phanith on 2018/09/12.
//  Copyright © 2018 Pich. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import ReactorKit

final class ViewControllerReactor: Reactor {
    
    enum Action {
        case didQuery(String)
        case didItemSelect(IndexPath)
    }
    
    enum Mutation {
        case setRepos([GithubRepositoryModel])
    }
    
    struct State {
        var query: String
        var repos: [GithubRepositoryModel]
    }
    
    let initialState: ViewControllerReactor.State
    
    weak var presenter: ViewControllerPresenter?
    
    private let router: ViewControllerRouter
    private let viewController: ViewController
    
    init(router: ViewControllerRouter, viewController: ViewController) {
        self.router = router
        self.viewController = viewController
        self.initialState = State(
            query: "",
            repos: []
        )
    }
}

// MARK: - Stream
extension ViewControllerReactor {
    
    func mutate(action: ViewControllerReactor.Action) -> Observable<ViewControllerReactor.Mutation> {
        switch action {
            
        case .didQuery(let query):
            if let `presenter` = self.presenter {
                return presenter.fetchRepository(query: query)
                    .catchError({ (error) -> Observable<[GithubRepositoryModel]> in Observable.just([]) })
                    .flatMap { repos -> Observable<[GithubRepositoryModel]> in
                        if (repos.count == 0) {
                            self.router.showErrorAlert(title: "Fetch Repo Error", message: "API Error")
                        }
                        return Observable.just(repos)
                    }
                    .flatMap { repos -> Observable<Mutation> in
                        return Observable.just(Mutation.setRepos(repos))
                }
            } else {
                return Observable.just(Mutation.setRepos([]))
            }
            
        case .didItemSelect(let indexPath):
            self.router.navigateToWebview(url: self.currentState.repos[indexPath.row].htmlUrl)
            return Observable.empty()
            
        }
    }
    
    func reduce(state: ViewControllerReactor.State, mutation: ViewControllerReactor.Mutation) -> ViewControllerReactor.State {
        var newState = state
        switch mutation {
            
        case .setRepos(let repos):
            newState.repos = repos
            
        }
        return newState
    }
}
