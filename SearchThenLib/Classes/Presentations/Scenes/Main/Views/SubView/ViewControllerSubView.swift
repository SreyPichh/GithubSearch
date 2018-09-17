//
//  ViewControllerSubView.swift
//  SearchThenLib
//
//  Created by ken.phanith on 2018/09/12.
//  Copyright © 2018 Pich. All rights reserved.
//

import Foundation
import SnapKit
import UIKit
import Then


class ViewControllerSubView {
    let label = UILabel().then {
        $0.text = "GitHub Search"
        }
    
    let searchInput =  UISearchBar().then {
        $0.placeholder = "Search for github repository..."
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor.gray.cgColor
    }
    
    let header = UIView().then{
        $0.backgroundColor = UIColor.lightGray
    }
    
    let result = UITableView()
    
    func subViewUpdateConstrain() {
        self.label.snp.makeConstraints { (make) in
            make.width.equalTo(115)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
        self.searchInput.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.label.snp.bottom)
        }
        self.result.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.top.equalTo(self.searchInput.snp.bottom)
        }
        
        self.header.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(100)
            
        }
    }
}

