//
//  StudentsListViewModel.swift
//  MVVMRxSwiftDemo
//
//  Created by Subroto Mohonto on 18/10/20.
//  Copyright © 2020 subroto training. All rights reserved.
//

import Foundation
import RxSwift

final class StudentsListViewModel{
    let title = "Student"
    
    private let studentService: StudentServiceProtocol
    
    init(studentService: StudentServiceProtocol = StudentService()) {
        
        self.studentService = studentService
    }
    
    func fetchStudentViewModel() -> Observable<[StudentViewModel]>
    {
        studentService.fetchStudents().map { $0.map { StudentViewModel(student: $0)}}
    }
}
