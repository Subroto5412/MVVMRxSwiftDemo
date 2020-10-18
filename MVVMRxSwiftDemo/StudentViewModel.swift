//
//  StudentViewModel.swift
//  MVVMRxSwiftDemo
//
//  Created by Subroto Mohonto on 18/10/20.
//  Copyright © 2020 subroto training. All rights reserved.
//

import Foundation

struct StudentViewModel {
    private let student: Student
    
    var  displayText: String{
        return student.name
    }
    init(student: Student) {
        self.student = student
    }
}
