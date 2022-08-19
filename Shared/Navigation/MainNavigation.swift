//
//  MainNavigationMac.swift
//  StudentView (iOS)
//
//  Created by Joshua Root on 8/17/22.
//

import SwiftUI

struct MainNavigation: View {
    @State private var selection: String? = Constants.COURSES_TAB_TAG
    
    var body: some View {
        #if os(macOS)
        MainNavigationMac(selection: $selection)
        #else
        MainNavigationMobile(selection: $selection)
        #endif
    }
}
