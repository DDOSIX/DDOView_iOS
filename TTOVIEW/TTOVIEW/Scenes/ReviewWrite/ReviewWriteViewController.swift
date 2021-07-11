//
//  ReviewWriteViewController.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import UIKit

class ReviewWriteViewController: UIViewController, ViewModelBindableType {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var reviewWriteButton: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var reviewContentLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var writeButton: UIButton!
    
    var viewModel: ReviewWriteViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUI()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "TilteTableViewCell", bundle: nil), forCellReuseIdentifier: "TilteTableViewCell")
        tableView.register(UINib(nibName: "NotesTableViewCell", bundle: nil), forCellReuseIdentifier: "NotesTableViewCell")
        tableView.register(UINib(nibName: "QnaTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "QnaTitleTableViewCell")
        tableView.register(UINib(nibName: "QnaTableViewCell", bundle: nil), forCellReuseIdentifier: "QnaTableViewCell")
        
        titleLabel.attributedText = "리뷰 작성하기".customStyle(font: .bold, size: 16, color: .appColor(.black))
        categoryLabel.attributedText = "서비스".customStyle(font: .regular, size: 14, color: .appColor(.black))
        companyLabel.attributedText = viewModel.items?.name.customStyle(font: .bold, size: 24, color: .appColor(.black))
        reviewContentLabel.attributedText = viewModel.items?.introduce.customStyle(font: .regular, size: 14, color: .appColor(.black))
        
    }
    
    func bindViewModel() {
        viewModel.closeAction = {
            print("✅✅✅✅✅✅✅✅✅✅✅")
            self.navigationController?.popViewController(animated: true)
        }
        
        writeButton.rx.action = viewModel.writeAction()
    }

}

extension ReviewWriteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1 + 1 + (viewModel.items?.questions.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let lastIdx = tableView.numberOfRows(inSection: 0) - 1
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TilteTableViewCell", for: indexPath) as! TilteTableViewCell
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "QnaTitleTableViewCell", for: indexPath) as! QnaTitleTableViewCell
            return cell
            
        case lastIdx:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotesTableViewCell", for: indexPath) as! NotesTableViewCell
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "QnaTableViewCell", for: indexPath) as! QnaTableViewCell
            guard let questions = viewModel.items?.questions else { return UITableViewCell() }
                let idx = lastIdx - indexPath.row - 1
            cell.setBinde(question: Array(questions.reversed())[idx])
            
            return cell
            
            
        }
    }
    
    
}
