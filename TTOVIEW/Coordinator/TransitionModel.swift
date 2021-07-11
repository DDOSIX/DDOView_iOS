//
//  TransititionStyle.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import Foundation

// 전환 방식을 표현하는
enum TransititionStyle {
    case root
    case push
    case modal
}

// 전환 시 에러
enum TransititionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}

