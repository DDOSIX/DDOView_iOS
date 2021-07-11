//
//  NotesTableViewCell.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/11.
//

import UIKit

class NotesTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        background.layer.cornerRadius = 8
        titleLabel.attributedText = "리뷰 작성 시 주의할 점!".customStyle(font: .bold, size: 14, color: .appColor(.black))
        contentLabel.attributedText = """
            리뷰 양식에 맞추어 내용을 충분히 작성해주세요.
            명예훼손, 저작권 침해 등의 내용이 포함되지 않도록 해주세요.
            비속어가 포함되지 않도록 주의해주세요.
            사용한 서비스와 작성한 리뷰가 일치하는지 확인해주세요.
            개인정보가 포함되지 않도록 주의해주세요.
            """
            .customStyle(font: .light, size: 12, color: .appColor(.black))
    }
}
