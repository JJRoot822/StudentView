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
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
