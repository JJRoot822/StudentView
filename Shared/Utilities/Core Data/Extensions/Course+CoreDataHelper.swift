//
//  Course+CoreDataHelper.swift
//  StudentView
//
//  Created by Joshua Root on 8/19/22.
//

import CoreData

extension Course {
    var courseName: String {
        return name ?? "Course Name"
    }
    
    var courseInstructorFirstName: String {
        return instructorFirstName ?? "Instructor First Name"
    }
    
    var courseInstructorLastName: String {
        return instructorLastName ?? "Instructor Last Name"
    }
    
    var courseStartDate: Date {
        return startDate ?? Date()
    }
    
    var courseEndDate: Date {
        return endDate ?? Date()
    }
    
    var courseStartTime: Date {
        return startTime ?? Date()
    }
    
    var courseEndTime: Date {
        return endTime ?? Date()
    }
}
