//
//  StudentViewApp.swift
//  Shared
//
//  Created by Joshua Root on 8/17/22.
//

import SwiftUI

@main
struct StudentViewApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
            #if os(macOS)
                .frame(width: 1200, height: 800)
            #endif
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
