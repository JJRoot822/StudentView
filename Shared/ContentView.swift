//
//  ContentView.swift
//  Shared
//
//  Created by Joshua Root on 8/17/22.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: StudentViewDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(StudentViewDocument()))
    }
}
