//
//  AddCourseScreen.swift
//  StudentView
//
//  Created by Joshua Root on 8/19/22.
//

import SwiftUI

struct AddCourseScreen: View {
    var body: some View {
        #if os(iOS)
        AddCourseScreenMobile()
        #else
        AddCourseScreenMac()
        #endif
    }
}
