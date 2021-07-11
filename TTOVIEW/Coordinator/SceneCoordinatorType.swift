//
//  SceneCoordinatorType.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {

    //Completable == Observable<Void>, 완료만 필요할때
    @discardableResult
    func transition(to scene: Scene, using styple: TransititionStyle, animated: Bool) -> Completable

    @discardableResult
    func close(animated: Bool) -> Completable
}
