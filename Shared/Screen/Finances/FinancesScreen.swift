//
//  FinancesScreen.swift
//  StudentView (iOS)
//
//  Created by Joshua Root on 8/18/22.
//

import SwiftUI

struct FinancesScreen: View {
    var body: some View {
        #if os(macOS)
        FinancesScreenMac()
        #else
        FinancesScreenMobile()
        #endif
    }
}
