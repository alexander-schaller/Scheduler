//
//  ClassListView.swift
//  Scheduler
//
//  Created by Alexander Schaller on 05/02/21.
//

import SwiftUI
import os.log

struct ClassListView: View {
    @Binding var schedule: Schedule
    @State private var showPopover = false
    @State private var addSemester = true
    var filteredCourses: [Course] {
        schedule.courses.filter {course in
            course.semester == schedule.currentSemester
        }
    }
    
    var body: some View {
        
        List {
            ForEach(filteredCourses) {cls in
                NavigationLink(destination: ClassView(class_: cls)){
                    ClassListItemView(class_: cls)
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Courses")
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                Menu(schedule.currentSemester) {
                    ForEach(schedule.semesters, id:\.self){semester in
                        SemesterButton(schedule: $schedule, semester: semester)
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button(action: {
                        self.addSemester = true
                        self.showPopover.toggle()
                    }, label: {
                        Label("Edit Semesters", systemImage: "square.and.pencil")
                    })
                    Button(action: {
                        self.addSemester = false
                        self.showPopover.toggle()
                    }, label: {
                        Label("Edit Courses", systemImage: "square.and.pencil")
                    })
                } label: {
                    Label("Edit", systemImage:"slider.horizontal.3")
                }
            }
        })
        .sheet(isPresented: $showPopover) {
            if addSemester {
                NavigationView{
                    DetailSemesterView(schedule: $schedule)
                        .toolbar(content: {
                            ToolbarItem(placement: .navigationBarLeading, content: {
                                Button(action: {
                                    showPopover = false
                                }, label: {
                                    Text("Done")
                                })
                            })
                        })
                    
                }
            } else {
                //EditCoursesView(courses: self.$modelData.Courses, showThis: self.$showPopover)
            }
        }
    }
}

struct ClassListView_Previews: PreviewProvider {
    static var previews: some View {
        let colorSchemeList: [ColorScheme] = [.dark, .light]
        ForEach(colorSchemeList, id: \.self) { colorSheme_ in
            NavigationView {
                ClassListView(schedule: .constant(Schedule.data[0]))
            } .environment(\.colorScheme, colorSheme_)
        }
    }
}
