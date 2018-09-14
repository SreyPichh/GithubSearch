//
//  ViewControllerReactor.swift
//  SearchThenLib
//
//  Created by ken.phanith on 2018/09/12.
//  Copyright © 2018 Pich. All rights reserved.
//

import Foundation
import ReactorKit
import RxCocoa
import RxSwift
import UIKit

class ViewControllerReactor: Reactor {
    
    enum Action {
        case search(String)
        case ditItemSelect(IndexPath)
    }
    enum Mutation {
        case searchValue(String)
        

    }
    var initialState: ViewControllerReactor.State
    struct State {
        var query: String
        var repos: [GithubRepositoryModel]
        }
    
    private let router: ViewControllerRouter
    private let viewController: ViewController
    
    init(router: ViewControllerRouter, viewController: ViewController) {
        self.router = router
        self.viewController = viewController
        self.initialState = State(query: "", repos: [])    
    }
    
}

extension ViewControllerReactor {
    func mutate(action: ViewControllerReactor.Action) -> Observable<ViewControllerReactor.Mutation> {
        switch action {

        case .search(let query):
            if let `presenter` = self.presenter {
                .catchError({(error) -> Observable<[GithubRepositoryModel]>})
            }
            print(query)
            return Observable.just(Mutation.searchValue(query))
        case .ditItemSelect(_): break
            
        }
                return Observable.empty()
    }
    
    
    func reduce(state: ViewControllerReactor.State, mutation: ViewControllerReactor.Mutation) -> ViewControllerReactor.State {
        var newState = state
        
        switch mutation {
        case .searchValue(let s):
            newState.s = s
            return newState
        }
    }
}
