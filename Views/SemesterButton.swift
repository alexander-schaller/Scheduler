//
//  SemesterButton.swift
//  Scheduler
//
//  Created by Alexander Schaller on 06/02/21.
//

import SwiftUI

struct SemesterButton: View {
    @Binding var schedule: Schedule
    var semester: String
    
    var body: some View {
        Button(action: {
            schedule.currentSemester = semester
            $schedule.update()
        }) {
            Text(semester)
        }
    }
}

struct SemesterButton_Previews: PreviewProvider {
    static var previews: some View {
        SemesterButton(schedule: .constant(Schedule.data[0]), semester: "Herbstsemester 2020")
    }
}
