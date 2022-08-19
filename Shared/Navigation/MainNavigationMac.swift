//
//  MainNavigationMac.swift
//  StudentView (iOS)
//
//  Created by Joshua Root on 8/18/22.
//

import SwiftUI

struct MainNavigationMac: View {
    @Binding var selection: String?
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(tag: Constants.COURSES_TAB_TAG, selection: $selection, destination: {
                    Text("Courses").toolbar { Spacer() }
                }, label: {
                    Label("Courses", systemImage: Constants.COURSES_NAV_ICON)
                })
                .padding(.all, 5)
                
                NavigationLink(tag: Constants.HOMEWORK_TAB_TAG, selection: $selection, destination: {
                    Text("Homework").toolbar { Spacer() }
                }, label: {
                    Label("Homework", systemImage: Constants.HOMEWORK_NAV_ICON)
                })
                .padding(.all, 5)
                
                NavigationLink(tag: Constants.TODO_LIST_TAB_TAG, selection: $selection, destination: {
                    Text("Todo List").toolbar { Spacer() }
                }, label: {
                    Label("Todo", systemImage: Constants.TODO_LIST_NAV_ICON)
                })
                .padding(.all, 5)
                
                NavigationLink(tag: Constants.FINANCES_TAB_TAG, selection: $selection, destination: {
                    FinancesScreen()
                }, label: {
                    Label("Finances", systemImage: Constants.FINANCES_NAV_ICON)
                })
                .padding(.all, 5)
                
                NavigationLink(tag: Constants.SETTINGS_TAB_TAG, selection: $selection, destination: {
                    Text("Settings").toolbar { Spacer() }
                }, label: {
                    Label("Settings", systemImage: Constants.SETTINGS_NAV_ICON)
                })
                .padding(.all, 5)
            }
            .listStyle(.sidebar)
        }
        .navigationViewStyle(.columns)
    }
}
