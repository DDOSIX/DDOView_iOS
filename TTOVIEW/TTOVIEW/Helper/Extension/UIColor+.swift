//
//  UIColor+.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import UIKit

enum AppColor {
    case black
    case blue
    case white
    case gray
}

extension UIColor {
    static func appColor(_ name: AppColor) -> UIColor {
        switch name {
        case .black:
            return .black
        case .blue:
            return #colorLiteral(red: 0, green: 0.5176470588, blue: 0.9568627451, alpha: 1)
        case .white:
            return .white
        case .gray:
            return #colorLiteral(red: 0.8941176471, green: 0.8941176471, blue: 0.8941176471, alpha: 0.6)
        }
    }
}
