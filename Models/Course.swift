//
//  Course.swift
//  Scheduler
//
//  Created by Alexander Schaller on 10/02/21.
//

import Foundation
import SwiftUI
import Combine

// MARK: Definition of a University Course
struct Course: Identifiable {
    
    //MARK: Properties of a Course
    let id: UUID
    var name: String
    var semester: String
    var code: String
    var color: Color
    var days: [weekday]
    var classes: [CourseUnit]
    
    init(id: UUID = UUID(), name: String, semester: String, code: String, color: Color, days:[weekday], classes: [CourseUnit]) {
        self.id = id
        self.name = name
        self.semester = semester
        self.code = code
        self.color = color
        self.days = days
        self.classes = classes
    }
    
    //func sortWeekdays() {
    //    self.days.sort(by: comparableWeekdays)
    //}
}

extension Course {
    static var data: [Course] {
        [
            Course(name: "Financial Economics", semester: "Frühjahrssemester 2021", code: "363-1000-00L", color: Color(UIColor.systemOrange), days: [.Tuesday], classes: [
                CourseUnit(weekdays: [.Tuesday], startTime: Time(hour: 4, min: 15, suffix: .p), endTime: Time(hour: 6, min: 0, suffix: .p), location: "ONLINE", type: .Lecture, professors: ["Prof. Dr. Antoine Bommier"])
            ]),
            Course(name: "Computer Networks", semester: "Frühjahrssemester 2021", code: "252-0064-00L", color: Color(UIColor.systemRed), days: [.Monday, .Thursday, .Friday], classes: [
                CourseUnit(weekdays: [.Monday], startTime: Time(hour: 2, min: 15, suffix: .p), endTime: Time(hour: 4, min: 0, suffix: .p), location: "ML D28", type: .Lecture, professors: ["Prof. Dr. Adrian Perrig", "Prof. Dr. Ankit Singla"]),
                CourseUnit(weekdays: [.Thursday], startTime: Time(hour: 2, min: 15, suffix: .p), endTime: Time(hour: 4, min: 0, suffix: .p), location: "HG D7.2", type: .Practical, professors: [""]),
                CourseUnit(weekdays: [.Friday], startTime: Time(hour: 10, min: 15, suffix: .a), endTime: Time(hour: 11, min: 55, suffix: .a), location: "ML D28", type: .Lecture, professors: ["Prof. Dr. Adrian Perrig", "Prof. Dr. Ankit Singla"])
            ]),
            Course(name: "Data Modeling and Databases", semester: "Frühjahrssemester 2021", code: "252-0063-00L", color: Color(UIColor.systemGreen), days: [.Wednesday, .Thursday, .Friday], classes: [
                CourseUnit(weekdays: [.Wednesday], startTime: Time(hour: 2, min: 15, suffix: .p), endTime: Time(hour: 4, min: 0, suffix: .p), location: "ML D28", type: .Lecture, professors: ["Prof. Dr. Ce Zhang"]),
                CourseUnit(weekdays: [.Thursday], startTime: Time(hour: 4, min: 15, suffix: .p), endTime: Time(hour: 6, min: 0, suffix: .p), location: "HG F5", type: .Practical, professors: [""]),
                CourseUnit(weekdays: [.Friday], startTime: Time(hour: 8, min: 15, suffix: .a), endTime: Time(hour: 10, min: 0, suffix: .a), location: "ML D28", type: .Lecture, professors: ["Prof. Dr. Ce Zhang"])
            ]),
            Course(name: "Formal Methods and Functional Programming", semester: "Frühjahrssemester 2021", code: "252-0058-00L", color: Color(UIColor.systemYellow), days: [.Tuesday, .Wednesday, .Thursday], classes: [
                CourseUnit(weekdays: [.Tuesday, .Thursday], startTime: Time(hour: 10, min: 15, suffix: .a), endTime: Time(hour: 11, min: 55, suffix: .a), location: "ML D28", type: .Lecture, professors: ["Prof. Dr. Peter Müller", "Prof. Dr. David Basin"]),
                CourseUnit(weekdays: [.Wednesday], startTime: Time(hour: 4, min: 15, suffix: .p), endTime: Time(hour: 6, min: 0, suffix: .p), location: "", type: .Practical, professors: [""])
            ]),
            Course(name: "Discovering Management", semester: "Herbstsemester 2020", code: "363-0778-00L", color: Color(UIColor.systemTeal), days: [.Friday], classes: [
                CourseUnit(weekdays: [.Friday], startTime: Time(hour: 8, min: 15, suffix: .a), endTime: Time(hour: 11, min: 55, suffix: .a), location: "ONLINE", type: .Lecture, professors: ["Bart Clarysse", "Stefano Brusoni", "Stefan Feuerriegel", "Gordela Grote", "Volker Hoffman"])
            ])
        ]
    }
}

extension Course {
    struct Data {
        var name: String = ""
        var semester: String = ""
        var code: String = ""
        var color: Color = .primary
        var days: [weekday] = []
        var classes: [CourseUnit] = []
    }
    
    var data: Data {
        return Data(name: name, semester: semester, code: code, color: color, days: days, classes: classes)
    }
}

extension Course: Hashable {
    static func == (lhs: Course, rhs: Course) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.semester == rhs.semester
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(semester)
    }
}
