//
//  Extension+Logger.swift
//  Bookworm
//
//  Created by Robert DeLaurentis on 3/13/24.
//

import OSLog

extension Logger {
    /// Using your bundle identifier is a great way to ensure a unique identifier.
    private static var subsystem = Bundle.main.bundleIdentifier ?? "❓"

    /// Logs the view cycles like a view that appeared.
    static let viewCycle = Logger(subsystem: subsystem, category: "viewcycle")

    /// All logs related to data flow.
    static let dataStatus = Logger(subsystem: subsystem, category: "dataStatus")
}
