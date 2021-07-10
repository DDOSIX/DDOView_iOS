//
//  BaseViewController.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import UIKit
import RxSwift

open class BaseViewController<T>:  UIViewController {
    
    open var viewModel: T!
    open var disposeBag = DisposeBag()
    
    deinit {
        print("🔲🔲🔲 deinit LoginViewController")
        //MARK:- 초기화 방법
        disposeBag = DisposeBag()
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
}

