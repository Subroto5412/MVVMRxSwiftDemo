//
//  ViewController.swift
//  MVVMRxSwiftDemo
//
//  Created by Subroto Mohonto on 18/10/20.
//  Copyright © 2020 subroto training. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let disposeBag = DisposeBag()
   
    var viewModel: StudentsListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.viewModel = StudentsListViewModel()
        viewModel.fetchStudentViewModel().bind(to: tableView.rx.items(cellIdentifier:"cell")) { index, viewModel, cell in
            
            cell.textLabel?.text = viewModel.displayText
        }.disposed(by: disposeBag)
    }
}

