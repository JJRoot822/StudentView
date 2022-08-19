//
//  CoreDataUtil.swift
//  StudentView
//
//  Created by Joshua Root on 8/17/22.
//

import SwiftUI
import CoreData

class CoreDataUtil {
//    static func saveAssignment(assignment: AssignmentInfo) {
//
//    }
//
//    static var saveCourse(course: CourseInfo) {
//
//    }
//
//    static func saveFee(fee: FeeInfo) {
//
//    }
    
    static func delete(object: NSManagedObject,
                       context: NSManagedObjectContext) {
        context.delete(object)
        save(context: context)
    }
    
    static func save(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            fatalError("Failed to save!")
        }
    }
}
