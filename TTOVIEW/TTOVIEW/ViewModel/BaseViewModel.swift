//
//  BaseViewModel.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import Foundation
import RxSwift
import Moya

class BaseViewModel: NSObject {

    let scenCoordinator: SceneCoordinatorType
    
    init(scenCoordinator: SceneCoordinatorType) {
        self.scenCoordinator = scenCoordinator
    }
    
    let provider = MoyaProvider<DefaultServerAPI>(plugins: [NetworkLoggerPlugin(), VerbosePlugin(verbose: true)])
    
}

struct VerbosePlugin: PluginType {
    let verbose: Bool

    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        #if DEBUG
        if let body = request.httpBody,
           let str = String(data: body, encoding: .utf8) {
            print("request to send: \(str))")
        }
        #endif
        return request
    }
}
