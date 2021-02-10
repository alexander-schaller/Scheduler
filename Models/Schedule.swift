//
//  ClassDatabase.swift
//  Scheduler (iOS)
//
//  Created by Alexander Schaller on 02/02/21.
//

import Foundation
import os.log

struct Schedule: Identifiable {
    
    //MARK: Properties
    let id: UUID
    var courses: [Course]
    var currentSemester: String
    var semesters: [String]
    
    init(id: UUID = UUID(), courses: [Course], currentSemester: String, semesters: [String]) {
        self.id = id
        self.courses = courses
        self.semesters = semesters
        self.currentSemester = currentSemester
    }
}

extension Schedule {
    static var data: [Schedule] {
        [
            Schedule(courses: Course.data, currentSemester: "Frühjahrssemester 2021", semesters: ["Frühjahrssemester 2021", "Herbstsemester 2020"]),
            Schedule(courses: [], currentSemester: "", semesters: [])
        ]
    }
}

extension Schedule {
    struct Data {
        var courses: [Course] = []
        var currentSemester: String = ""
        var semesters: [String] = []
    }
    
    var data: Data {
        return Data(courses: courses, currentSemester: currentSemester, semesters: semesters)
    }
    
}
