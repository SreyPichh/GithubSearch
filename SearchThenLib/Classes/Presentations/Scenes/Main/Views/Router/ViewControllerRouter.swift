//
//  ViewControllerRouter.swift
//  SearchThenLib
//
//  Created by Jilay-PC on 9/14/18.
//  Copyright © 2018 Pich. All rights reserved.
//

import Foundation

final class ViewControllerRouter {
    weak var viewController: ViewController?
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }
}

extension ViewControllerRouter{
    func navigateToWebView(url: String) {
        let webVC = WebViewController()
        self.viewController?.viewControllerDelegate = webVC as? ViewControllerProtocol
        self.viewController?.viewControllerDelegate?.passURL(url: url)
        self.viewController?.present(webVC, animated: true, completion: nil)
    }
}
