//
//  WebViewController.swift
//  SearchThenLib
//
//  Created by Jilay-PC on 9/14/18.
//  Copyright © 2018 Pich. All rights reserved.
//

import Foundation
import UIKit

class WebViewController: UIViewController {
    var viewControllerDelegate: ViewControllerProtocol?
    
    var subView: WebViewControllerSubView = WebViewControllerSubView()
    
}

extension WebViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.subView.header)
        self.subView.header.addSubview(self.subView.backBtn)
        self.view.addSubview(self.subView.webView)
    }
    override func viewDidLayoutSubviews() {
        self.subView.webViewUpdateConstraint()
    }
    
}
