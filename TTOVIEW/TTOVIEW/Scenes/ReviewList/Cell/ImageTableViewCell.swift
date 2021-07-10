//
//  ImageTableViewCell.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import UIKit
import Kingfisher

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var companyImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }
    
    func setBind(url: String) {
        guard let url = URL(string: url) else { return }
        companyImageView.kf.setImage(with: url)
    }
}
