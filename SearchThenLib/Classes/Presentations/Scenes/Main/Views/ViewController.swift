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
    
    var viewControllerDelegate: ViewControllerProtocol?
    
    /// Usecase
    private let usecase: ViewControllerUsecase = ViewControllerUsecase()
    
    /// Router
    private var router: ViewControllerRouter?
    
    /// Presenter
    private var presenter: ViewControllerPresenter?
    
    
}
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(self.subView.header)
        self.subView.header.addSubview(self.subView.label)
        self.view.addSubview(self.subView.searchInput)
        self.view.addSubview(self.subView.result)
        
        self.router = ViewControllerRouter(viewController: self)
        self.presenter = ViewControllerPresenter(usecase: self.usecase, router: self.router!)
        
        self.reactor = ViewControllerReactor(router: self.router!, viewController: self)
        self.reactor?.presenter = self.presenter
    
         self.subView.result.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    override func viewDidLayoutSubviews() {
        self.subView.subViewUpdateConstrain()
    }
}

extension ViewController: StoryboardView {
    
    func bind(reactor: ViewControllerReactor) {
        
        self.subView.searchInput.rx.text
            .filter { $0!.count > 3 }
            .map { Reactor.Action.didQuery( $0! ) }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.subView.result.rx.itemSelected
            .map { Reactor.Action.didItemSelect($0) }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.reactor?.state
            .map { $0.repos }
            .bind(to: self.subView.result.rx.items(cellIdentifier: "cell")) { indexPath, repo, cell in
                cell.textLabel?.text = repo.fullName
            }
            .disposed(by: self.disposeBag)
        
    }
    
}



