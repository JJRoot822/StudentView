//
//  StudentViewApp.swift
//  Shared
//
//  Created by Joshua Root on 8/17/22.
//

import SwiftUI

@main
struct StudentViewApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: StudentViewDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
