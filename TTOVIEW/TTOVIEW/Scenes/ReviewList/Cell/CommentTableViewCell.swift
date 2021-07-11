//
//  CommentTableViewCell.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var action: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setBind(title: String, nickName: String, date: String) {
        titleLabel.attributedText = title.customStyle(font: .bold, size: 16, color: .appColor(.black))
        nickNameLabel.attributedText = title.customStyle(font: .light, size: 12, color: .appColor(.black))
        dateLabel.attributedText = title.customStyle(font: .light, size: 12, color: .appColor(.black))
    }
}
