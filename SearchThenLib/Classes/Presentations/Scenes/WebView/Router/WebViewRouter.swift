//
//  WebViewRouter.swift
//  SearchThenLib
//
//  Created by ken.phanith on 2018/09/17.
//  Copyright © 2018 Pich. All rights reserved.
//

import Foundation

final class WebViewRouter {
    
    /// refered to viewController type of this router class
    weak var viewController: WebViewController?
    
    /// init func
    ///
    /// - Parameter viewController: WebviewController
    init(viewController: WebViewController) {
        self.viewController = viewController
    }
    
}


// MARK: - I/F
extension WebViewRouter {
    
    func dismiss() {
        self.viewController?.dismiss(animated: true, completion: nil)
    }
    
}
