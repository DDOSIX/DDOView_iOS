//
//  LableTableViewCell.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/11.
//

import UIKit

class LableTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
    
    func setBind(title: String, nickName: String, date: String) {
        titleLabel.attributedText = title.customStyle(font: .bold, size: 16, color: .appColor(.black))
        nickNameLabel.attributedText = nickName.customStyle(font: .light, size: 12, color: .appColor(.black))
        dateLabel.attributedText = date.customStyle(font: .light, size: 12, color: .appColor(.black))
    }
}
