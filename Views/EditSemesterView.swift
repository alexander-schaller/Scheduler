//
//  EditSemesterView.swift
//  Scheduler
//
//  Created by Alexander Schaller on 10/02/21.
//

import SwiftUI

struct EditSemesterView: View {
    @Binding var scheduleData: Schedule.Data
    @State private var newSemester = ""
    
    
    var body: some View {
        List {
            Section(header: Text("Semesters")) {
                ForEach(scheduleData.semesters, id: \.self) { semester in
                    Text(semester)
                }
                .onDelete{indices in
                scheduleData.semesters.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Semester", text: $newSemester)
                    Button(action:{
                        withAnimation {
                            scheduleData.semesters.append(newSemester)
                            newSemester = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newSemester.isEmpty)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct EditSemesterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditSemesterView(scheduleData: .constant(Schedule.data[0].data))
                .navigationTitle("Edit Semesters")
                .navigationBarItems(leading: Button("Cancel") {
                }, trailing: Button("Done") {
                })
        }
    }
}
