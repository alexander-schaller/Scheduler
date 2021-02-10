//
//  CourseUnit.swift
//  Scheduler
//
//  Created by Alexander Schaller on 10/02/21.
//

import Foundation

//MARK: Defining a single course unit
struct CourseUnit: Hashable, Identifiable {
    let id: UUID
    var weekdays: [weekday]
    var startTime: Time
    var endTime: Time
    var location: String
    var type: classType
    var professors: [String]
    
    init(id: UUID = UUID(), weekdays: [weekday], startTime: Time, endTime: Time, location: String, type: classType, professors: [String]) {
        self.id = id
        self.weekdays = weekdays
        self.startTime = startTime
        self.endTime = endTime
        self.location = location
        self.type = type
        self.professors = professors
    }
    
}

extension CourseUnit {
    static var data: [CourseUnit] {
        [
            CourseUnit(weekdays: [.Monday], startTime: Time(hour: 2, min: 15, suffix: .p), endTime: Time(hour: 4, min: 0, suffix: .p), location: "ML D28", type: .Lecture, professors: ["Prof. Dr. Adrian Perrig", "Prof. Dr. Ankit Singla"]),
            CourseUnit(weekdays: [.Thursday], startTime: Time(hour: 2, min: 15, suffix: .p), endTime: Time(hour: 4, min: 0, suffix: .p), location: "HG D7.2", type: .Practical, professors: [""]),
            CourseUnit(weekdays: [.Friday], startTime: Time(hour: 10, min: 15, suffix: .a), endTime: Time(hour: 11, min: 55, suffix: .a), location: "ML D28", type: .Lecture, professors: ["Prof. Dr. Adrian Perrig", "Prof. Dr. Ankit Singla"])
        ]
    }
}

extension CourseUnit {
    struct Data {
        var weekdays: [weekday] = []
        var startTime: Time = Time(hour: 0, min: 0, suffix: .a)
        var endTime: Time = Time(hour: 1, min: 0, suffix: .a)
        var location: String = "Somewhere"
        var type: classType = .Lecture
        var professors: [String] = []
    }
    
    var data: Data {
        return Data(weekdays: weekdays, startTime: startTime, endTime: endTime, location: location, type: type, professors: professors)
    }
}
