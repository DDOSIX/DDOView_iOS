//
//  ReplyTableViewCell.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/11.
//

import UIKit

class ReplyTableViewCell: UITableViewCell {

    @IBOutlet weak var background: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        background.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
