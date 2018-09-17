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
    }
    enum Mutation {
        case searchValue(String)

    }
    var initialState: ViewControllerReactor.State
    struct State {
        var s: String
        }
    
    init() {
        self.initialState = State(s: "")
    }
    func mutate(action: ViewControllerReactor.Action) -> Observable<ViewControllerReactor.Mutation> {
        switch action {
        case .search(let s):
            print(s)
            return Observable.just(Mutation.searchValue(s))
        }
//        return Observable.empty()
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
