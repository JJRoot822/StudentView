//
//  StudentViewDocument.swift
//  Shared
//
//  Created by Joshua Root on 8/17/22.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var exampleText: UTType {
        UTType(importedAs: "com.joshrootdev.pdf")
    }
}

struct StudentViewDocument: FileDocument {
    var text: String

    init(text: String = "") {
        self.text = text
    }

    static var readableContentTypes: [UTType] { [.exampleText] }

    init(configuration: ReadConfiguration) throws {
        configuration.contentType = .pdf
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        text = string
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = text.data(using: .utf8)!
        return .init(regularFileWithContents: data)
    }
}
