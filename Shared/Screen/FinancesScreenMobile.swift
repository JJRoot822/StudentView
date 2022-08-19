//
//  FinancesScreenMobile.swift
//  StudentView (iOS)
//
//  Created by Joshua Root on 8/18/22.
//

import SwiftUI

struct FinancesScreenMobile: View {
    @State private var selection: String? = Constants.PAID_FEES_TAG
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(tag: Constants.PAID_FEES_TAG, selection: $selection, destination: {
                    PaidFeesScreen()
                }, label: {
                    Label("Paid Fees", systemImage: Constants.PAID_FEES_ICON)
                })
                
                NavigationLink(tag: Constants.UNPAID_FEES_TAG, selection: $selection, destination: {
                    UnpaidFeesScreen()
                }, label: {
                    Label("Unpaid Fees", systemImage: Constants.UNPAID_FEES_ICON)
                })
                
                
            }
        }
    }
}
