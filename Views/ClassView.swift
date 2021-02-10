//
//  ClassView.swift
//  Scheduler
//
//  Created by Alexander Schaller on 02/02/21.
//

import SwiftUI

struct ClassView: View {
    
    var class_: Course
    
    var body: some View {
        ScrollView {
            
            Rectangle()
                .fill(class_.color)
                .ignoresSafeArea(edges: .top)
                .frame(height: 600)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding(.top,-300)
            VStack {
                ForEach(class_.days, id: \.self) { day in
                    HStack{
                        Text(weekdayToString(weekday: day))
                            .font(.title2)
                        Spacer()
                    }
                    .padding(.leading)
                    VStack {
                        ForEach(class_.classes, id: \.self) { cls in
                            if cls.weekdays.contains(day) {
                                ClassUnitView(accentColor: class_.color, classUnit: cls) .padding([.bottom,.leading,.trailing])
                            }
                        }
                    }
                }
            }
        }
        .background(Rectangle().fill(Color(UIColor.systemBackground)))
        .ignoresSafeArea(edges: [.top,.bottom])
        .navigationTitle(class_.name)
    }
}

struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        ClassView(class_: Course.data[2]).environment(\.colorScheme, .dark)
    }
}
