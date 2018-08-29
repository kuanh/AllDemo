//
//  DataServices.swift
//  DemoQuanLySinhVien
//
//  Created by KuAnh on 28/02/2018.
//  Copyright © 2018 KuAnh. All rights reserved.
//

import Foundation

class DataServices {
    static let share: DataServices = DataServices()
    
    private var _schools: [School]!
    
    var schools: [School] {
        set {
            _schools = newValue
        }
        get {
            if _schools == nil {
                update(places: &(_schools), fromFileName: "School.plist", rootKey: "School")
            }
            return _schools
        }
    }
    

    
    private var _Class: [Class]!
    
    var Class: [Class] {
        set {
            _Class = newValue
        }
        get {
            if _Class == nil {
                update(places: &(_Class), fromFileName: "Class.plist", rootKey: "Class")
            }
            return _Class
        }
    }
    
    private var _students: [Students]!
    
    var students: [Students] {
        set {
            _students = newValue
        }
        get {
            if _students == nil {
                update(places: &(_students), fromFileName: "Student.plist", rootKey: "Student")
            }
            return _students
        }
    }
    
    

    
    var selectedSchool: School? {
        didSet {
            guard selectedSchool != nil else {return}
            displayedClass = Class.filter {
                $0.shoolCode == selectedSchool
            }
        }
    }
    
    var displayedClass: [Class] = [] {
        didSet {
            NotificationCenter.default.post(name: .didFillterClasses, object: nil, userInfo: nil)
        }
    }
    
    var selectedClass: Class? {
        didSet {
            guard selectedClass != nil else {return}

            displayedStudents = students.filter{$0.classCode == selectedClass!.classCode}
        }
    }
    
    var displayedStudents: [Students] = [] {
        didSet {
            NotificationCenter.default.post(name: .didFillterStudents, object: nil, userInfo: nil)
        }
    }

    
    func update<T : PlaceProtocol>(places: inout[T]!, fromFileName fileName: String, rootKey: String){
        places = []
        guard let root = ParsePlist().getDictionary(plist: fileName) else { return }
        
        // lay ra 1 mang du lieu thong qua key
        guard let placeDictionries = root[rootKey] as? [Dictionary<AnyHashable , Any>] else { return }
        for dict in placeDictionries {
            if let place = T(dict: dict){
                places.append(place)
            }
        }
    }
}
