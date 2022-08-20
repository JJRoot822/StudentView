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
    
    @State private var searchTerm: String = ""
    
    var body: some View {
        Group {
            if fees.count > 0 {
                List {
                    ForEach(filterPaidFees(searchTerm: searchTerm), id: \.title.self) { fee in
                        HStack(alignment: .center) {
                            Text("\(fee.feeTitle)")
                                .bold()
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                Text("Amount Charged: \(Constants.currencyFormatter.string(from: NSNumber(value: fee.amountCharged))!)")
                                    .foregroundColor(.secondary)
                                
                                Text("Amount Paid: \(Constants.currencyFormatter.string(from: NSNumber(value: fee.amountPaid))!)")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            } else {
                Text("No Fees to Show Right Now")
                    .foregroundColor(.secondary)
                    .italic()
            }
        }
        .searchable(text: $searchTerm)
    }
    
    func filterPaidFees(searchTerm: String) -> [Fee] {
        let unpaidFees: [Fee] = fees.filter { !$0.paid }
        
        if searchTerm.isEmpty {
            return unpaidFees
        } else {
            return unpaidFees.filter { $0.feeTitle.contains(searchTerm) }
        }
    }
}
