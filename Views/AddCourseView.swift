//
//  AddCourseView.swift
//  Scheduler
//
//  Created by Alexander Schaller on 05/02/21.
//

import SwiftUI

struct AddCourseView: View {
    @Binding var isEdit: Bool
    var oldCourse: Course
    var currentSemester: String
    @State private var courseName: String
    @Binding var courses: Schedule
    @Binding var showThis: Bool
    @State private var pickedColor: Color
    @State private var courseCode: String
    @State private var showAlert: Bool = false
    
    private func addNewCourse() {
        if !courseName.isEmpty {
            print("Adding new semester \(courseName)")
            if !courses.addCourse(course: Course(name: courseName, semester: currentSemester, code: courseCode, color: pickedColor, days: [], classes: [])) {
                showAlert = true
            }
        }
        self.showThis = false
    }
    
    private func editCourse() {
        if !courseName.isEmpty {
            courses.editCourse(oldCourse: oldCourse, newCourse: Course(name: courseName, semester: currentSemester, code: courseCode, color: pickedColor, days: [], classes: []))
        }
        self.showThis = false
    }
    
    private func deleteCourse() {
        courses.removeCourse(course: oldCourse)
        self.showThis = false
    }
    
    init(isEdit: Binding<Bool>, courses: Binding<Schedule>, showThis: Binding<Bool>, oldCourse: Course, currentSemester: String) {
        self._isEdit = isEdit
        self.oldCourse = oldCourse
        self._courseName = State(wrappedValue: oldCourse.name)
        self._pickedColor = State(wrappedValue: oldCourse.color)
        self._courseCode = State(wrappedValue: oldCourse.code)
        self._courses = courses
        self._showThis = showThis
        self.currentSemester = currentSemester
    }
    
    var body: some View {
        NavigationView{
            VStack {
                HStack {
                    Text("Name of the Course")
                        .font(.headline)
                    Spacer()
                }
                HStack {
                    TextField("Course", text: $courseName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack {
                    Text("Course Code").font(.headline)
                    Spacer()
                }
                HStack {
                    TextField("Code", text: $courseCode)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                ColorPicker(selection: self.$pickedColor, supportsOpacity: false) {
                    Text("Pick a color").font(.headline)
                }
                if isEdit {
                    Button(action: {deleteCourse()}, label: {
                        Image(systemName: "trash.fill")
                    })
                    .foregroundColor(Color(UIColor.systemBackground))
                    .padding([.top,.bottom], 5)
                    .padding([.leading, .trailing])
                    .background(Rectangle().fill(Color(.red)))
                    .cornerRadius(15)
                    .padding(.top)
                }
                Spacer()
            }
            .padding()
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Course Already Exists"), message: Text("This course already exists, change the course code"), dismissButton: .default(Text("Dismiss")))
            })
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading, content: {
                    Button(action: {
                        self.showThis = false
                    },
                    label: {
                        Text("Cancel").accentColor(.red)
                    })
                })
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    if isEdit {
                        Button(action: {
                            editCourse()
                        }, label: {
                            Text("Save").bold()
                        })
                    } else {
                        Button(action: {
                            addNewCourse()
                        }, label: {
                            Text("Add").bold()
                        })
                    }
                })
            })
            .navigationBarTitle(courseName.isEmpty ? "New Course" : courseName, displayMode: .inline)
        }
    }
}
struct AddCourseView_Previews: PreviewProvider {
    static var previews: some View {
        AddCourseView(isEdit: .constant(false), courses: .constant(ModelData().Courses), showThis: .constant(true), oldCourse: Course(name: "", semester: "", code: "123", color: Color(UIColor.red), days: [], classes: []), currentSemester: ModelData().Courses.currentSemester)
    }
}
