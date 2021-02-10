//
//  EditSemesterView.swift
//  Scheduler
//
//  Created by Alexander Schaller on 06/02/21.
//

import SwiftUI

struct DetailSemesterView: View {
    
    @Binding var schedule: Schedule
    @State private var scheduleData: Schedule.Data = Schedule.Data()
    @State var isPresented: Bool = false
    
    var body: some View {
        Content()
            .navigationTitle("Semesters")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        isPresented = true
                        scheduleData = schedule.data
                    }, label: {
                        Image(systemName: "plus")
                    })
                })
            })
            .fullScreenCover(isPresented: $isPresented) {
                NavigationView {
                    EditSemesterView(scheduleData: $scheduleData)
                        .navigationTitle("Edit Semesters")
                        .navigationBarItems(leading: Button("Cancel") {
                            isPresented = false
                        }, trailing: Button("Done") {
                            isPresented = false
                            //schedule.update(from: scheduleData)
                        })
                }
            }
    }
    
    @ViewBuilder
    func Content() -> some View {
        if scheduleData.semesters.isEmpty {
            Text("There don't seem to be any Semesters on record")
                .bold()
                .multilineTextAlignment(.center)
                .padding()
                
        } else {
            List {
                Section(header: Text("Semesters")) {
                    ForEach(scheduleData.semesters, id: \.self) {semester in
                        Label(semester, systemImage: "calendar")
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct DetailSemesterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailSemesterView(schedule: .constant(Schedule.data[0]))
        }
    }
}
