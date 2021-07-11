//
//  CommentWriteTableViewCell.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/11.
//

import UIKit

class CommentWriteTableViewCell: UITableViewCell {
    @IBOutlet weak var commentSubjectLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        commentSubjectLabel.attributedText = "댓글".customStyle(font: .bold, size: 14, color: .black)
        commentCountLabel.attributedText = "0개".customStyle(font: .bold, size: 14, color: .appColor(.blue))
    }
    
}
