//
//  ReviewDetailViewController.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import UIKit

class ReviewDetailViewController: UIViewController, ViewModelBindableType {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ReviewDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    @IBAction func backAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func setUI() {
        tableView.delegate = nil
        tableView.dataSource = nil
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "MainItemTableViewCell", bundle: nil), forCellReuseIdentifier: "MainItemTableViewCell")
        tableView.register(UINib(nibName: "LableTableViewCell", bundle: nil), forCellReuseIdentifier: "LableTableViewCell")
        tableView.register(UINib(nibName: "QnaTableViewCell", bundle: nil), forCellReuseIdentifier: "QnaTableViewCell")
        tableView.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentTableViewCell")
        tableView.register(UINib(nibName: "CommentWriteTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentWriteTableViewCell")
        tableView.register(UINib(nibName: "ReplyTableViewCell", bundle: nil), forCellReuseIdentifier: "ReplyTableViewCell")
        
        titleLabel.attributedText = "리뷰".customStyle(font: .bold, size: 16, color: .appColor(.black))
    }
    
    func bindViewModel() {
        
    }
    
}

extension ReviewDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    private enum TableViewType: Int, CaseIterable {
        case reviewContents
        case comment
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        TableViewType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if TableViewType.reviewContents.rawValue == section {
            return 1 + 1 + 3// MockCount
        } else {
            return 5 // 리뷰 갯수만큼
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if TableViewType.reviewContents.rawValue == indexPath.section  {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MainItemTableViewCell", for: indexPath) as! MainItemTableViewCell
                cell.setBind(category: "test", company: "testCompany", content: "test 리뷰ㅜㄹ뷰ㅣ류뷔루비비비", isButtonHide: true)
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "LableTableViewCell", for: indexPath) as! LableTableViewCell
                cell.setBind(title: "리뷰제목입니다", nickName: "이규현", date: "2021.07.10 01:36:37")
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "QnaTableViewCell", for: indexPath) as! QnaTableViewCell
                return cell
            }
        } else {
            if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentWriteTableViewCell", for: indexPath) as! CommentWriteTableViewCell
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ReplyTableViewCell", for: indexPath) as! ReplyTableViewCell
                return cell
            }
        }
    }
}
