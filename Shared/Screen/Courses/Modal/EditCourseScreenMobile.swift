//
//  EditCourseScreenMobile.swift
//  StudentView
//
//  Created by Joshua Root on 8/20/22.
//

import SwiftUI

struct EditCourseScreenMobile: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String
    @State private var instructorFirstName: String
    @State private var instructorLastName: String
    @State private var startDate: Date
    @State private var endDate: Date
    @State private var startTime: Date
    @State private var endTime: Date
    @State private var credits: Double
    
    var course: Course
    
    init(course: Course) {
        self.course = course
        
        _name = State(wrappedValue: course.courseName)
        _instructorFirstName = State(wrappedValue: course.courseInstructorFirstName)
        _instructorLastName = State(wrappedValue: course.courseInstructorLastName)
        _startDate = State(wrappedValue: course.courseStartDate)
        _endDate = State(wrappedValue: course.courseEndDate)
        _startTime = State(wrappedValue: course.courseStartTime)
        _endTime = State(wrappedValue: course.courseEndTime)
        _credits = State(wrappedValue: course.credits)
    }
    
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
                
                Stepper("\(Constants.creditsFormatter.string(from: NSNumber(value: credits))!) Credits", onIncrement: {
                    credits += 0.1
                }, onDecrement: {
                    if credits > 0 {
                        credits -= 0.1
                    }
                })
            }
            .navigationTitle(Text("Edit Course"))
            #if os(iOS)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Course", action: editCourse)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            #endif
        }
        #if os(iOS)
        .navigationViewStyle(.stack)
        #endif
    }
    
    private func editCourse() {
        course.name = name
        course.instructorFirstName = instructorFirstName
        course.instructorLastName = instructorLastName
        course.startDate = startDate
        course.endDate = endDate
        course.startTime = startTime
        course.endTime = endTime
        course.credits = credits
        
        CoreDataUtil.save(context: viewContext)
        
        dismiss()
    }
}
