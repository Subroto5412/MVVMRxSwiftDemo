//
//  StudentService.swift
//  MVVMRxSwiftDemo
//
//  Created by Subroto Mohonto on 18/10/20.
//  Copyright © 2020 subroto training. All rights reserved.
//

import Foundation
import RxSwift

protocol StudentServiceProtocol {
    func fetchStudents() -> Observable<[Student]>
}
   
class StudentService: StudentServiceProtocol{
    func fetchStudents() -> Observable<[Student]> {
        return Observable.create { observer ->Disposable in
                   
                   guard let path = Bundle.main.path(forResource: "student_info", ofType: "json") else{
                       observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                       return Disposables.create {}
                   }
                   do{
                       let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                       let  students = try JSONDecoder().decode([Student].self, from: data)
                       observer.onNext(students)
                   }
                   catch {
                       observer.onError(error)
                   }
                   return Disposables.create { }
               }
    }
    
}
