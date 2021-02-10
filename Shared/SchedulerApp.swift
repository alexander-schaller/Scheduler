//
//  SchedulerApp.swift
//  Shared
//
//  Created by Alexander Schaller on 02/02/21.
//

import SwiftUI

@main
struct SchedulerApp: App {
    @State private var schedule = Schedule.data[0]
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ClassListView(schedule: $schedule)
            }
        }
    }
}
