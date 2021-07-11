//
//  BaseViewController.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import UIKit
import RxSwift

class BaseViewController:  UIViewController {
    
    var disposeBag = DisposeBag()
    
    deinit {
        print("🔲🔲🔲 deinit LoginViewController")
        //MARK:- 초기화 방법
        disposeBag = DisposeBag()
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
}

