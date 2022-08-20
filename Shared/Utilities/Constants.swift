//
//  Constants.swift
//  StudentView (iOS)
//
//  Created by Joshua Root on 8/17/22.
//

import SwiftUI

class Constants {
    static let DEFAULT_EXPORT_FILE_NAME = "StudentView_\(Date())"
    
    static let COURSES_TAB_TAG    = "courses"
    static let HOMEWORK_TAB_TAG   = "homework"
    static let FINANCES_TAB_TAG   = "finances"
    static let TODO_LIST_TAB_TAG  = "todo"
    static let SETTINGS_TAB_TAG   = "settings"
    static let PAID_FEES_TAG      = "pait"
    static let UNPAID_FEES_TAG    = "unpaid"
    
    static let COURSES_TAB_ICON   = "book.closed.fill"
    static let COURSES_NAV_ICON   = "book.closed"
    static let HOMEWORK_TAB_ICON  = "doc.on.doc.fill"
    static let HOMEWORK_NAV_ICON  = "doc.on.doc"
    static let FINANCES_TAB_ICON  = "dollarsign.circle.fill"
    static let FINANCES_NAV_ICON  = "dollarsign.circle"
    static let TODO_LIST_TAB_ICON = "list.bullet"
    static let TODO_LIST_NAV_ICON = "list.bullet"
    static let SETTINGS_TAB_ICON  = "gearshape.fill"
    static let SETTINGS_NAV_ICON  = "gearshape"
    static let PAID_FEES_ICON     = "checkmark.circle"
    static let UNPAID_FEES_ICON   = "multiply.circle"
    
    static var creditsFormatter: NumberFormatter = {
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        
        return formatter
    }()
    
    static let currencyFormatter: NumberFormatter = {
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }()
    
    static var dateFormatter: DateFormatter = {
        var dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        return dateFormatter
    }()
    
    static var timeFormatter: DateFormatter = {
        let timeFormatter: DateFormatter = DateFormatter()
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .short
        
        return timeFormatter
    }()
}
