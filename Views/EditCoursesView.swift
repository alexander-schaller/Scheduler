//
//  EditCoursesView.swift
//  Scheduler
//
//  Created by Alexander Schaller on 10/02/21.
//

import SwiftUI

struct EditCoursesView: View {
    @Binding var modelData: ModelData
    @State var showPopup: Bool = false
    @State var isEdit: Bool = true
    @State var oldCourse: Course = Course(name: String(), semester: String(), code: "", color: Color(UIColor.systemFill), days: [], classes: [])
    @Binding var showThis: Bool;
    var filteredCourses: [Course] {
        courses.courses.filter { cls in
            cls.semester == courses.currentSemester
        }
    }
    
    var body: some View {
        NavigationView{
            Content()
                .sheet(isPresented: $showPopup, content: {
                    AddCourseView(isEdit: $isEdit, courses: $modelData.Courses, showThis: $showPopup, oldCourse: oldCourse, currentSemester: courses.currentSemester)
                })
                .navigationTitle("Courses")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Button(action: {
                            showPopup.toggle()
                            isEdit = false
                        }, label: {
                            Image(systemName: "plus")
                        })
                    })
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Button(action: {
                            showThis = false
                            modelData.objectWillChange.send()
                        }, label: {
                            Text("Done")
                        })
                    })
                })
            
        }
    }
    
    @ViewBuilder
    func Content() -> some View {
        if courses.semesters.isEmpty {
            Text("There don't seem to be any Semesters on record")
                .bold()
                .multilineTextAlignment(.center)
                .padding()
                
        } else {
            if courses.courses.isEmpty {
                Text("There don't seem to be any Courses on record for \(courses.currentSemester)")
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()
            }
            List(filteredCourses, id:\.self) {course in
                Button(course.name) {
                    showPopup.toggle()
                    isEdit = true
                    oldCourse = course
                }
            }
        }
    }
}

struct EditCoursesView_Previews: PreviewProvider {
    static var previews: some View {
        EditCoursesView(modelData: .constant(ModelData()), showThis: .constant(true))
    }
}
