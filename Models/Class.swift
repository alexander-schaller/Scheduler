//
//  Class.swift
//  Scheduler
//
//  Created by Alexander Schaller on 02/02/21.
//

import Foundation
import SwiftUI
import Combine

// Converts weekday enum to String Type
func weekdayToString(weekday:weekday) -> String {
    var weekdayString: String
    switch weekday{
    case .Monday :
        weekdayString = "Monday"
    case .Tuesday :
        weekdayString = "Tuesday"
    case .Wednesday:
        weekdayString = "Wednesday"
    case .Thursday:
        weekdayString = "Thursday"
    case .Friday:
        weekdayString = "Friday"
    case .Saturday:
        weekdayString = "Satruday"
    case .Sunday:
        weekdayString = "Sunday"
    }
    return weekdayString
}

// Converts time to string
func timeToString(time: Time) -> String {
    var sfix: String;
    var minute: String;
    switch time.suffix {
    case .p:
        sfix = "PM"
    case .a:
        sfix = "AM"
    }
    
    
    if time.min/10 == 0 {
        minute = "0\(time.min)"
    } else {
        minute = "\(time.min)"
    }
    return "\(time.hour):\(minute) \(sfix)"
}

func classTypeToString(type: classType) -> String {
    switch type {
    case .Lecture:
        return "Lecture"
    case .Practical:
        return "Practical"
    case .Exam:
        return "Exam"
    case .Seminar:
        return "Seminar"
    }
}

// MARK: Defines the Type of class
enum classType {
    case Lecture
    case Practical
    case Seminar
    case Exam
}

enum weekday {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}

enum timeSuffix {
    case p
    case a
}

//MARK: Definition of Time
struct Time: Hashable {
    var hour: Int;
    var min: Int;
    var suffix: timeSuffix;
}

// Assuming first and second are different, which they should be
func comparableWeekdays(first: weekday, second: weekday) -> Bool {
    if first == second {
        return true
    }
    
    switch first{
    case .Monday :
        return true
    case .Tuesday :
        if second == .Monday {
            return false
        } else {
            return true
        }
    case .Wednesday:
        if second == .Monday || second == .Tuesday {
            return false
        } else {
            return true
        }
    case .Thursday:
        if second == .Monday || second == .Tuesday || second == .Wednesday {
            return false
        } else {
            return true
        }
    case .Friday:
        if second == .Saturday || second == .Sunday {
            return true
        } else {
            return false
        }
    case .Saturday:
        if second == .Sunday {
            return true
        } else {
            return false
        }
    case .Sunday:
        return false
    }
}

