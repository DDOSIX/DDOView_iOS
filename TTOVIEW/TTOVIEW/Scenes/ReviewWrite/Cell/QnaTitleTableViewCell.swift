//
//  QnaTitleTableViewCell.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/11.
//

import UIKit

class QnaTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var anserTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        selectionStyle = .none
        anserTextView.layer.borderWidth = 1
        anserTextView.layer.borderColor = UIColor.appColor(.gray).withAlphaComponent(0.6).cgColor
        anserTextView.layer.cornerRadius = 5
        titleLabel.attributedText = "Q. 리뷰 제목을 써주세요.".customStyle(font: .regular, size: 12, color: .appColor(.blue), alignment: .left)
    }
    
}
