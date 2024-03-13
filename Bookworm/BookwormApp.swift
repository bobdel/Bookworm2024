//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Robert DeLaurentis on 3/12/24.
//

import OSLog
import SwiftData
import SwiftUI

@main
struct BookwormApp: App {

    // MARK: - Properties

//    static let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "❓", category: "general")

    // MARK: - body View

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
