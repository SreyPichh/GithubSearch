//
//  WebviewReactor.swift
//  SearchThenLib
//
//  Created by ken.phanith on 2018/09/17.
//  Copyright © 2018 Pich. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import ReactorKit

final class WebViewReactor: Reactor {
    
    enum Action {
        case didDismiss
    }
    
    enum Mutation {
        
    }
    
    struct State {
        
    }
    
    var initialState: WebViewReactor.State
    
    var router: WebViewRouter
    
    init(router: WebViewRouter) {
        self.router = router
        self.initialState = State()
    }
    
    func mutate(action: WebViewReactor.Action) -> Observable<WebViewReactor.Mutation> {
        switch action {
            
        case .didDismiss:
            self.router.dismiss()
            return Observable.empty()
            
        }
    }
    
}
