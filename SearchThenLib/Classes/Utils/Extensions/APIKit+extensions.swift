//
//  APIKit+extensions.swift
//  SearchThenLib
//
//  Created by ken.phanith on 2018/09/12.
//  Copyright © 2018 Pich. All rights reserved.
//
import Foundation
import APIKit
import RxSwift

extension Session {
    
    /// SendRequest APIKit
    ///
    /// - Parameter request: Observable<T.Response>
    /// - Returns: Disposables
    func sendRequest<T: Request>(request: T) -> Observable<T.Response> {
        return Observable.create{ [unowned self] observer in
            let task = self.send(request) { result in
                switch result {
                    
                case .success(let response):
                    observer.onNext(response)
                    
                case .failure(.responseError(let apiError as APIError)):
                    observer.onError(apiError)
                    
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create {
                task?.cancel()
            }
        }
    }
    
    /// SendRequest APIKit
    ///
    /// - Parameter request: Observable<T.Response>
    /// - Returns: Session.sendRequest(request: request)
    static func sendRequest<T: Request>(request: T) -> Observable<T.Response> {
        return Session.shared.sendRequest(request: request)
    }
    
}
