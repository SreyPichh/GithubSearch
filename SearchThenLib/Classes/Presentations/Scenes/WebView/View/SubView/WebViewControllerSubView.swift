//
//  WebViewControllerSubView.swift
//  SearchThenLib
//
//  Created by Jilay-PC on 9/14/18.
//  Copyright © 2018 Pich. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Then

class WebViewControllerSubView {
    let webView = UIWebView()
    
    let header = UIView().then{
        $0.backgroundColor = UIColor.lightGray
    }
    let backBtn = UIButton().then {
        $0.setTitle("Back", for: .normal)
        $0.setTitleColor(UIColor.blue, for: .normal)
        
    }
    
    func webViewUpdateConstraint() {
        self.backBtn.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(30)
            make.left.top.equalToSuperview()
//            make.top.equalToSuperview()
            
        }
        self.header.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(100)
            make.centerX.top.equalToSuperview()
        }
        self.webView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview().offset(self.header.bounds.size.height)
            make.top.equalTo(self.header.snp.bottom)
        }
    }
    
}
