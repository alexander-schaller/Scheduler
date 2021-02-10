//
//  ClassListItemView.swift
//  Scheduler
//
//  Created by Alexander Schaller on 05/02/21.
//

import SwiftUI

struct ClassListItemView: View {
    var class_: Course;
    
    var body: some View {
        
        VStack {
            Spacer()
            HStack {
                Circle()
                    .frame(width: 20, height: 20, alignment: .center)
                    .foregroundColor(class_.color)
                VStack {
                    HStack {
                        Text(class_.code)
                            .font(.subheadline)
                        Spacer()
                    }
                    HStack {
                        Text(class_.name)
                        Spacer()
                    }
                }
                .padding(.leading)
               
            }
            Spacer()
        }.padding([.leading,.trailing])
    }
}

struct ClassListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ClassListItemView(class_: Course.data[0])
    }
}
