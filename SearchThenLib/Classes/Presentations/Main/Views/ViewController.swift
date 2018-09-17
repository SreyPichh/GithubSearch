//
//  ViewController.swift
//  SearchThenLib
//
//  Created by ken.phanith on 2018/09/12.
//  Copyright © 2018 Pich. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ReactorKit

class ViewController: UIViewController {
    
    private var subView: ViewControllerSubView = ViewControllerSubView()
    var disposeBag: DisposeBag = DisposeBag()
    
    
}
extension ViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(self.subView.label)
        self.view.addSubview(self.subView.searchInput)
        self.view.addSubview(self.subView.result)
        
//        self.reactor = ViewControllerReactor()
    }
    
    override func viewDidLayoutSubviews() {
        self.subView.subViewUpdateConstrain()
    }
}

extension ViewController: StoryboardView {
    func bind(reactor: ViewControllerReactor) {
        self.subView.searchInput.rx.text
            .filter{($0?.count)! > 0 }
            .map{Reactor.Action.search($0!)}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        }
}



