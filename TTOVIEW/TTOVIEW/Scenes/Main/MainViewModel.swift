//
//  MainViewModel.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import Foundation
import RxSwift
import RxCocoa
import Action

struct MockItems {
    let category: String
    let company: String
    let content: String
}

class MainViewModel: BaseViewModel {
    var obItems = PublishSubject<MainResponse>()
    var items: MainResponse?
    
    func requestMain() {
        provider.rx
            .request(.main)
            .filterSuccessfulStatusCodes()
            .map(MainResponse.self)
            .subscribe(onSuccess: { [unowned self] (res) in
                self.items = res
                print(res)
                self.obItems.onNext(res)
            }) { (err) in
                print(err)
        }
        .disposed(by: rx.disposeBag)
    }
    
    func fetchItems() -> MainResponse {
        items!
    }
    
    func fetchItemsCount() -> Int {
        items?.count ?? 0
    }
    
    func goReviewDetailAction(idx: Int) -> CocoaAction {
        return CocoaAction { _ in
            let reviewListViewModel = ReviewListViewModel(scenCoordinator: self.scenCoordinator)
            reviewListViewModel.companyID = idx
            let reviewListScene = Scene.reviewList(reviewListViewModel)
            self.scenCoordinator.transition(to: reviewListScene, using: .push, animated: true)
            return Observable<Any>.empty().asObservable().map { _ in }
        }
    }
}
