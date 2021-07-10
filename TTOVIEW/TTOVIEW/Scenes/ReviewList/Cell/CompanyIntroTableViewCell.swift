//
//  CompanyIntroTableViewCell.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import UIKit

class CompanyIntroTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var companyBackgroundView: UIView!
    @IBOutlet weak var serviceBackgroundView: UIView!
    @IBOutlet weak var comanyTextView: UITextView!
    @IBOutlet weak var serviceTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
    }
    
    func setUI() {
        titleLabel.attributedText = "기업 & 서비스 소개".customStyle(font: .bold, size: 14, color: .appColor(.black))
        companyBackgroundView.layer.cornerRadius = 5
        companyBackgroundView.layer.borderColor =  UIColor.appColor(.gray).withAlphaComponent(0.6).cgColor
        companyBackgroundView.layer.borderWidth = 1
        comanyTextView.contentInset = .zero
        comanyTextView.isEditable = false
        
        serviceBackgroundView.layer.cornerRadius = 5
        serviceBackgroundView.layer.borderColor =  UIColor.appColor(.gray).withAlphaComponent(0.6).cgColor
        serviceBackgroundView.layer.borderWidth = 1
        serviceTextView.contentInset = .zero
        serviceTextView.isEditable = false
    }
    
}
