//
//  FinancesScreenMac.swift
//  StudentView (iOS)
//
//  Created by Joshua Root on 8/18/22.
//

import SwiftUI

struct FinancesScreenMac: View {
    @AppStorage("selected-tab") private var selection: String = Constants.PAID_FEES_TAG
    
    var body: some View {
        TabView(selection: $selection) {
            PaidFeesScreen()
                .tag(Constants.PAID_FEES_TAG)
                .tabItem {
                    Label("Paid Fees", systemImage: Constants.PAID_FEES_ICON)
                }
            
            UnpaidFeesScreen()
                .tag(Constants.UNPAID_FEES_TAG)
                .tabItem {
                    Label("UnpaidFees", systemImage: Constants.UNPAID_FEES_ICON)
                }
        }
    }
}
