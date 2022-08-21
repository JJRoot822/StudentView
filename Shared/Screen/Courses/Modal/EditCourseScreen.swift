//
//  EditCourseScreen.swift
//  StudentView
//
//  Created by Joshua Root on 8/20/22.
//

import SwiftUI

struct EditCourseScreen: View {
    var course: Course
    
    var body: some View {
        #if os(iOS)
        EditCourseScreenMobile(course: course)
        #else
        EditCourseScreenMac(course: course)
        #endif
    }
}
