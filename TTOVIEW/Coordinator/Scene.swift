//
//  Scene.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import UIKit

enum Scene {
    case splash
    case login(LoginViewModel)
    case main(MainViewModel)
    case reviewRequest(ReviewRequestViewModel)
    case reviewList(ReviewListViewModel)
    case reviewWrite(ReviewWriteViewModel)
    case reviewDetail(ReviewDetailViewModel)
}

// 스토리 보드에 있는 씬을 생성 연관값이 저장된 뷰 모델을 바인딩해서 리턴
extension Scene {
    func instantiate(from storyboard: String = "Main") -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        
        switch self {
        
        case .splash:
            guard let splashVC = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as? SplashViewController else { fatalError() }
            return splashVC
            
        case .login:
            guard let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { fatalError() }
            return loginVC
            
        case .main(let viewModel):
            guard var mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { fatalError() }
            
            let naviVC = UINavigationController()
            naviVC.isNavigationBarHidden = true
            mainVC.bind(viewModel: viewModel)
            naviVC.setViewControllers([mainVC], animated: false)
            return naviVC
        
        case .reviewRequest(let viewModel):
            guard var reviewRequestVC = storyboard.instantiateViewController(withIdentifier: "ReviewRequestViewController") as? ReviewRequestViewController else { fatalError() }
            reviewRequestVC.bind(viewModel: viewModel)
            return reviewRequestVC
            
        case .reviewList(let viewModel):
            guard var reviewListVC = storyboard.instantiateViewController(withIdentifier: "ReviewListViewController") as? ReviewListViewController else { fatalError() }
            reviewListVC.bind(viewModel: viewModel)
            return reviewListVC
            
        case .reviewWrite(let viewModel):
            guard var reviewWriteVC =  storyboard.instantiateViewController(withIdentifier: "ReviewWriteViewController") as? ReviewWriteViewController else { fatalError() }
            reviewWriteVC.bind(viewModel: viewModel)
            return reviewWriteVC
            
        case .reviewDetail(let viewModel):
            guard var reviewDetailVC = storyboard.instantiateViewController(withIdentifier: "ReviewDetailViewController") as? ReviewDetailViewController else { fatalError() }
            reviewDetailVC.bind(viewModel: viewModel)
            
            return reviewDetailVC
        }
    }
}
