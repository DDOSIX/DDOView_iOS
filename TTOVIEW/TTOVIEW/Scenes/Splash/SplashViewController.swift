//
//  SplashViewController.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [unowned self] in
            
            // TODO: 로그인 정보 유무에 따라.
            if true {
                let coordinator = SceneCoordinator(window:
                    UIApplication.shared.windows.first!)
                let mainViewModel = MainViewModel(scenCoordinator: coordinator)
                let mainScene = Scene.main(mainViewModel)
                coordinator.transition(to: mainScene, using: .root, animated: true)
            } else {
                let coordinator = SceneCoordinator(window:
                    UIApplication.shared.windows.first!)
                let loginViewModel = LoginViewModel(scenCoordinator: coordinator)
                let loginScene = Scene.login(loginViewModel)
                coordinator.transition(to: loginScene, using: .root, animated: true)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
