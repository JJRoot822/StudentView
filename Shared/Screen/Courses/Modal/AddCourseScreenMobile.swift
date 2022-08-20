//
//  AddCourseScreenMobile.swift
//  StudentView
//
//  Created by Joshua Root on 8/20/22.
//

import SwiftUI

struct AddCourseScreenMobile: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var instructorFirstName: String = ""
    @State private var instructorLastName: String = ""
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    @State private var startTime: Date = Date()
    @State private var endTime: Date = Date()
    @State private var credits: Double = 0
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Course Name", text: $name)
                TextField("Instructor First Name", text: $instructorFirstName)
                TextField("Instructor Last Name", text: $instructorLastName)
                
                DatePicker("Start Time", selection: $startTime, displayedComponents: .hourAndMinute)
                DatePicker("End Time", selection: $endTime, displayedComponents: .hourAndMinute)
                
                DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                
                HStack {
                    Text("\(Constants.creditsFormatter.string(from: NSNumber(value: credits))!)")
                    
                    Stepper("\(Constants.creditsFormatter.string(from: NSNumber(value: credits))!)", onIncrement: {
                        credits += 0.1
                    }, onDecrement: {
                        if credits > 0 {
                            credits -= 0.1
                        }
                    })
                }
            }
            .navigationTitle(Text("Add Course"))
            #if os(iOS)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Course", action: addCourse)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        
                    }
                }
            }
            #endif
        }
        #if os(iOS)
        .navigationViewStyle(.stack)
        #endif
    }
    
    private func addCourse() {
        let course = Course(context: viewContext)
        course.name = name
        course.instructorFirstName = instructorFirstName
        course.instructorLastName  = instructorLastName
        course.credits             = credits
        course.startTime           = startTime
        course.endTime             = endTime
        course.startDate           = startDate
        course.endDate             = endDate
        
        CoreDataUtil.save(context: viewContext)
    }
}
