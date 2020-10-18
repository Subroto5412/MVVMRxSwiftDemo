//
//  ViewController.swift
//  MVVMRxSwiftDemo
//
//  Created by Subroto Mohonto on 18/10/20.
//  Copyright © 2020 subroto training. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
               
        let service = StudentService()
        service.fetchStudentData().subscribe(onNext: { students in
            print(students)
            }).disposed(by: disposeBag)
    }
}

