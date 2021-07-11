//
//  MainItemTableViewCell.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import UIKit

class MainItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var reviewContentLabel: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    var event: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }
    
    @IBAction func event(_ sender: Any) {
        event?()
    }
    
    func setBind(category: String, company: String, content: String, isButtonHide: Bool = false) {
        // FIXME: 왜 안보이지?
        categoryLabel.attributedText = category.customStyle(font: .light, size: 12, color: .appColor(.blue))
        companyLabel.attributedText = company.customStyle(font: .bold, size: 24, color: .appColor(.black))
        reviewContentLabel.attributedText = content.customStyle(font: .regular, size: 14, color: .appColor(.black))
        detailButton.isHidden = isButtonHide
    }
}
