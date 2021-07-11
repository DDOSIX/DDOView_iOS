//
//  MainViewController.swift
//  TTOVIEW
//
//  Created by 이규현 on 2021/07/10.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa
//import RxDataSources
import Action
import NSObject_Rx

class MainViewController: UIViewController, ViewModelBindableType {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var writeButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.requestMain()
    }
    
    func setUI() {
        //MARK: tableView
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = .zero
        // FIXME: Maybe delegate was already set in xib or storyboard and now it's being overwritten in code.
        tableView.register(UINib(nibName: "MainItemTableViewCell", bundle: nil), forCellReuseIdentifier: "MainItemTableViewCell")
        
        // MARK: UI
        titleLabel.attributedText = "스타트업의 모든 서비스를 체험하고 정성스러운 리뷰를 남겨주세요!".customStyle(font: .bold, size: 20, color: .appColor(.black), alignment: .left)
    }
    
    func bindViewModel() {
        // FIXME: Assertion failed: This is a feature to warn you that there is already a delegate (or data source) set somewhere previously. The action you are trying to perform will clear that delegate (data source) and that means that some of your features that depend on that delegate (data source) being set will likely stop working. If you are ok with this, try to set delegate (data source) to `nil` in front of this operation.
        viewModel.obItems
            .subscribe { res in
                self.tableView.reloadData()
            }
            .disposed(by: rx.disposeBag)
        
        // FIXME:  MainItemTableViewCell
        /*
         viewModel.items.bind(to: tableView.rx.items(cellIdentifier: "MainItemTableViewCell", cellType: MainItemTableViewCell.self)) { (row,item,cell) in
         print(item)
         }
         .disposed(by: rx.disposeBag)
         */
        //
        //        viewModel.obItems
        //            .asObservable().bind(to: tableView.rx.items(cellIdentifier: "MainItemTableViewCell", cellType: MainItemTableViewCell.self)) { (idx, element, cell) in
        //
        //                cell.setBind(category: element.companyCategory, company: element.companyName, content: element.introduce)
        //
        //            }
        //            .disposed(by: rx.disposeBag)
    }
}
//
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.fetchItemsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainItemTableViewCell", for: indexPath) as! MainItemTableViewCell
        let items = viewModel.fetchItems()
        let item = items[indexPath.row]
        print(item)
        cell.setBind(category: item.companyCategory, company: item.companyName, content: item.introduce)
        cell.detailButton.rx.action = viewModel.goReviewDetailAction(idx: item.companyID)
        
        return cell
        
    }
    
}
