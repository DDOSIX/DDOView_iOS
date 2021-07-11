//
//  String+.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import UIKit

enum FontStyle: String {
    case black = "NotoSansCJKkr-Black"
    case bold = "NotoSansCJKkr-Bold"
    case demiLight = "NotoSansCJKkr-DemiLight"
    case light = "NotoSansCJKkr-Light"
    case medium = "NotoSansCJKkr-Medium"
    case regular = "NotoSansCJKkr-Regular"
    case thin = "NotoSansCJKkr-Thin"
//    case SemiBold = "NotoSansMonoCJKkr-Bold"
//    case Regular = "NotoSansMonoCJKkr-Regular"
}


extension String {
    
    func customStyle(font: FontStyle, size: CGFloat, color: UIColor, alignment: NSTextAlignment = .center, kern: CGFloat = 0, lineHeightMultiple: CGFloat = 0 ) -> NSAttributedString {
        let style = NSMutableParagraphStyle()
        style.lineHeightMultiple = lineHeightMultiple
        style.alignment = alignment
        let text = NSAttributedString(
            string: self,
            attributes: [
                .foregroundColor: color,
                .kern: kern,
                .font: UIFont(name: font.rawValue, size: size) ?? UIFont.systemFont(ofSize: size),
                .paragraphStyle: style
            ])
        return text
    }
}
