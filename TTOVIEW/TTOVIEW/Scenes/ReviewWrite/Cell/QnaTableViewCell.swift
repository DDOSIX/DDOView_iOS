//
//  QnATableViewCell.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import UIKit

class QnaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var anserTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        setUI()
    }
    
    func setUI() {
        anserTextView.layer.borderWidth = 1
        anserTextView.layer.borderColor = UIColor.appColor(.gray).withAlphaComponent(0.6).cgColor
        anserTextView.layer.cornerRadius = 5
    }
    
    func setBinde(question: Question) {
        questionLabel.attributedText = "Q. \(question)".customStyle(font: .regular, size: 12, color: .appColor(.blue), alignment: .left)
    }
    
}
