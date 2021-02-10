//
//  ClassUnitView.swift
//  Scheduler
//
//  Created by Alexander Schaller on 02/02/21.
//

import SwiftUI

struct ClassUnitView: View {
    
    var accentColor: Color
    var classUnit: CourseUnit
    
    var body: some View {
        VStack {
            HStack{
                Text("\(timeToString(time: classUnit.startTime))-\(timeToString(time: classUnit.endTime))")
                Spacer()
                Text(classTypeToString(type: classUnit.type))
            }
            HStack {
                ForEach(classUnit.professors, id: \.self) { professor in
                    if classUnit.professors.firstIndex(of: professor)! < 2 {
                        Text(professor)
                            .font(.subheadline)
                            .foregroundColor(accentColor)
                            .accentColor(accentColor)
                    } else if classUnit.professors.firstIndex(of: professor)! == 3 {
                        Text("...")
                            .font(.subheadline)
                            .foregroundColor(accentColor)
                            .accentColor(accentColor)
                    }
                }
                Spacer()
            }
            HStack{
                Text(classUnit.location)
                Spacer()
            }.padding(.top)
        } .padding()
        .background(Rectangle()
                        .fill(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(25)
        
        )
    }
}

struct ClassUnitView_Previews: PreviewProvider {
    static var previews: some View {
        ClassUnitView(accentColor: .orange, classUnit: CourseUnit.data[0])
    }
}
