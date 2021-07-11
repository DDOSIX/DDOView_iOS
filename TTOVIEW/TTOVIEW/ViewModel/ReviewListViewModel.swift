//
//  ReviewListViewModel.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import Foundation
import RxSwift
import Action

class ReviewListViewModel: BaseViewModel {
    var obItems = PublishSubject<ReviewListResponse>()
    var items: ReviewListResponse?
    var companyID: Int = 0
    
    func requestReviewList() {
        provider.rx
            .request(.reviewList(companyId: companyID))
            .filterSuccessfulStatusCodes()
            .map(ReviewListResponse.self)
            .subscribe(onSuccess: { [unowned self] (res) in
                self.items = res
                print(res)
                self.obItems.onNext(res)
            }) { (err) in
                print(err)
        }
        .disposed(by: rx.disposeBag)
    }
    
//    func requestReviewWrite() {
//        provider.rx
//            .request(.reviewList(companyId: companyID))
//            .filterSuccessfulStatusCodes()
//            .map(ReviewListResponse.self)
//            .subscribe(onSuccess: { [unowned self] (res) in
//                self.items = res
//                print(res)
//                self.obItems.onNext(res)
//            }) { (err) in
//                print(err)
//        }
//        .disposed(by: rx.disposeBag)
//    }
    
    func wirteAcion() -> CocoaAction {
        return CocoaAction { _ in
            let reviewWriteViewModel = ReviewWriteViewModel(scenCoordinator: self.scenCoordinator)
            reviewWriteViewModel.items = self.items
            let reviewWriteScene = Scene.reviewWrite(reviewWriteViewModel)
            self.scenCoordinator.transition(to: reviewWriteScene, using: .push, animated: true)
            return Observable<Any>.empty().asObservable().map { _ in }
        }
    }
    
    func reviewDetailAcion() -> CocoaAction {
        return CocoaAction { _ in
            let reviewDetailViewModel = ReviewDetailViewModel(scenCoordinator: self.scenCoordinator)
            let reviewDetailScene = Scene.reviewDetail(reviewDetailViewModel)
            self.scenCoordinator.transition(to: reviewDetailScene, using: .push, animated: true)
            return Observable<Any>.empty().asObservable().map { _ in }
        }
    }
}

