//
//  CourseCell.swift
//  StudentView
//
//  Created by Joshua Root on 8/19/22.
//

import SwiftUI

struct CourseCell: View {
    var course: Course
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(course.courseName)")
                    .bold()
                
                Text("\(Constants.timeFormatter.string(from: course.courseStartTime)) - \(Constants.timeFormatter.string(from: course.courseEndTime))")
                    .foregroundColor(.secondary)
                
                Text("\(Constants.dateFormatter.string(from: course.courseStartDate)) - \(Constants.dateFormatter.string(from: course.courseEndDate))")
                    .foregroundColor(.secondary)
                
                Text("\(course.courseInstructorLastName), \(course.courseInstructorFirstName)")
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text("\(Constants.creditsFormatter.string(from: NSNumber(value: course.credits))!) Credits")
                .bold()
        }
    }
}
