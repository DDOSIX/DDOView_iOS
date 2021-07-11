//
//  ReviewListViewController.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import UIKit

class ReviewListViewController: UIViewController, ViewModelBindableType {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ReviewListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.requestReviewList()
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
        tableView.register(UINib(nibName: "MainItemTableViewCell", bundle: nil), forCellReuseIdentifier: "MainItemTableViewCell")
        tableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
        tableView.register(UINib(nibName: "CompanyIntroTableViewCell", bundle: nil), forCellReuseIdentifier: "CompanyIntroTableViewCell")
        tableView.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentTableViewCell")
        
        titleLabel.attributedText = "리뷰를 구합니다!".customStyle(font: .bold, size: 16, color: .appColor(.black))
    }
    
    func bindViewModel() {
        viewModel.obItems.subscribe { res in
            self.tableView.reloadData()
        }
        .disposed(by: rx.disposeBag)
    }
}


extension ReviewListViewController: UITableViewDelegate, UITableViewDataSource {
    
    private enum TableViewType: Int, CaseIterable {
        case company
        case reviews
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        TableViewType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if TableViewType.company.rawValue == section {
            return 3
        } else {
            return viewModel.items?.reviews.count ?? 0 // 리뷰 갯수만큼
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let vm = viewModel.items
        
        if TableViewType.company.rawValue == indexPath.section  {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as! ImageTableViewCell
                cell.setBind(url: "https://picsum.photos/1000/1000")
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MainItemTableViewCell", for: indexPath) as! MainItemTableViewCell
                
                cell.setBind(category: "이커머스", company: vm?.name ?? "", content: vm?.introduce ?? "", isButtonHide: true)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyIntroTableViewCell", for: indexPath) as! CompanyIntroTableViewCell
                cell.setBind(companyContent: vm?.reviewListResponseDescription, serviceContent: vm?.serviceDescription)
                cell.reviewWriteButton.rx.action = viewModel.wirteAcion()
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell
            cell.setBind(title: vm?.reviews[indexPath.row].reviewTitle ?? "", nickName: vm?.reviews[indexPath.row].memberName ?? "", date: vm?.reviews[indexPath.row].createDate ?? "")
            cell.action.rx.action = viewModel.reviewDetailAcion()
            return cell
        }
    }
    
}

