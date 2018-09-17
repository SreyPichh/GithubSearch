//
//  ViewControllerPresenter.swift
//  SearchThenLib
//
//  Created by Jilay-PC on 9/14/18.
//  Copyright © 2018 Pich. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class ViewControllerPresenter {
    private let disposeBag: DisposeBag = DisposeBag()
    private let usecase: ViewControllerUsecase
    private let router: ViewControllerRouter
    
    init(usecase: ViewControllerUsecase, router: ViewControllerRouter) {
        self.usecase = usecase
        self.router = router
    }
}

extension ViewControllerPresenter {
    func fetchRepository(query: String) -> Observable<[GithubRepositoryModel]> {
        return self.usecase.fetchRepository(query: query)
    }
}
