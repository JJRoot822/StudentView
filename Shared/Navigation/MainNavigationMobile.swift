//
//  MainNavigationMobile.swift
//  StudentView (iOS)
//
//  Created by Joshua Root on 8/18/22.
//

import SwiftUI

struct MainNavigationMobile: View {
    @Binding var selection: String?
    
    var body: some View {
        TabView(selection: $selection) {
            CoursesScreen()
                .tag(Constants.COURSES_TAB_TAG)
                .tabItem {
                    Label("Courses", systemImage: Constants.COURSES_TAB_ICON)
                }
            
            Text("Homework")
                .tag(Constants.HOMEWORK_TAB_TAG)
                .tabItem {
                    Label("Homework", systemImage: Constants.HOMEWORK_TAB_ICON)
                }
            
            Text("Todo List")
                .tag(Constants.TODO_LIST_TAB_TAG)
                .tabItem {
                    Label("Todo", systemImage: Constants.TODO_LIST_TAB_ICON)
                }
            
            FinancesScreen()
                .tag(Constants.FINANCES_TAB_TAG)
                .tabItem {
                    Label("Finances", systemImage: Constants.FINANCES_TAB_ICON)
                }
            
            Text("Settings")
                .tag(Constants.SETTINGS_TAB_TAG)
                .tabItem {
                    Label("Settings", systemImage: Constants.SETTINGS_TAB_ICON)
                }
        }
    }
}
