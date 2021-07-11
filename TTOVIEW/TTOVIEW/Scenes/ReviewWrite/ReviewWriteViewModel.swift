//
//  ReviewWriteViewModel.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import Foundation
import RxSwift
import RxCocoa
import Action

struct ReviewQuestRequest {
    let questID: Int
    let answer: String
}


class ReviewWriteViewModel: BaseViewModel {
    var items: ReviewListResponse?
    var closeAction: (() -> Void)?
//
    func writeAction() -> CocoaAction {
        return CocoaAction { _ in
            self.requestReviewWrite()
            return Observable<Any>.empty().asObservable().map { _ in }
        }
    }
    
    func requestReviewWrite() {
        var xx = [ReviewQuestRequest]()
        items?.questions.forEach {
            let x = ReviewQuestRequest(questID: $0.questionID, answer: "답변답변쓰")
            xx.append(x)
        }
        
        provider.rx
            .request(.reviewWrite(title: "리뷰제목입니다", companyId: items?.id ?? 0, memberId: /*회원가입없음 고정*/1, reviewQuestRequests: xx))
            .filterSuccessfulStatusCodes()
//            .map(ReviewListResponse.self)
            .subscribe(onSuccess: { [unowned self] (res) in
                self.closeAction?()
                
            }) { (err) in
                print(err)
        }
        .disposed(by: rx.disposeBag)
    }
////    var obItems = PublishSubject<MainResponse>()
//    var items: MainResponse?
//
//    func requestMain() {
//        provider.rx
//            .request(.main)
//            .filterSuccessfulStatusCodes()
//            .map(MainResponse.self)
//            .subscribe(onSuccess: { [unowned self] (res) in
//                self.items = res
//                print(res)
//                self.obItems.onNext(res)
//            }) { (err) in
//                print(err)
//        }
//        .disposed(by: rx.disposeBag)
//    }
}
