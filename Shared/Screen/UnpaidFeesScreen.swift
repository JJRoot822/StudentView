//
//  UnpaidFeesScreen.swift
//  StudentView (iOS)
//
//  Created by Joshua Root on 8/18/22.
//

import SwiftUI

struct UnpaidFeesScreen: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(
                keyPath: \Fee.title,
                ascending: true
            )
        ],
        animation: .default
    )
    private var fees: FetchedResults<Fee>
    
    var body: some View {
        Text("Unpaid Fees")
    }
}
