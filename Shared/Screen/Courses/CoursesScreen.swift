//
//  CoursesScreen.swift
//  StudentView
//
//  Created by Joshua Root on 8/19/22.
//

import SwiftUI





struct CoursesScreen: View {
    var body: some View {
        #if os(iOS)
        CoursesScreenMobile()
        #else
        CoursesScreenMac()
        #endif
    }
}
