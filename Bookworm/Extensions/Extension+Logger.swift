//
//  Extension+Logger.swift
//
//  Created by Robert DeLaurentis on 3/13/24.
//  Last Modified on 10/4/24.
//  https://gist.github.com/bobdel/8baab707f7532fa61994a1718b96aa8f

///**
/// A general purpose global logging and signpost configuration
/// file tested on Xcode 16 and iOS 18 with
/// Swift 6 toolchain and strict concurrency
///**

import OSLog

// MARK: - Signposts

// Typical Usage - PointsOfInterest:
//
// Generates a single labeled data point in the trace
// Add as many as needed thoughout the app
// (events also apppear in the os_signpost insturment)
//
let pointsOfInterest = OSSignposter(
    subsystem: Bundle.main.bundleIdentifier!,
    category: OSLog.Category.pointsOfInterest
)
// call site:
// pointsOfInterest.emitEvent("Message", id: .exclusive)

// Typical Usage - Signposter:
//
// Used to measure time intervals at runtime
// Best when release builds are run on device
// Each signpost uses a generated ID and matching name strings
// Begin and End Intervals accept string interpolation messages
//
// general signposter
let signposter = OSSignposter(
    subsystem: Bundle.main.bundleIdentifier!,
    category: "signposter"
)
// call site (3 lines):
// let signpostID = signposter.makeSignpostID()
// let mySignpostState = signposter.beginInterval("Name (must match)", id: signpostID, "Start Message")
// // interval work to measure
// signposter.endInterval("Name (must match)", mySignpostState, "End Message")

// MARK: - Logger

// Usage:
//
// Output appears in console logs
//
// Logger.category.logLevel("Message String")
//
// for example:
// Logger.general.debug("Book added. title: \(newBook.title)")
//
// LogLevels available:
// .notice, .debug, .info, .error, .log, .critical, .warning, .fault

let defaultLogger = Logger()

extension Logger {

    /// Use bundle ID for a unique identifier.
    private static let subsystem = Bundle.main.bundleIdentifier ?? "❓"

    /// Logs events that do not appear apply to another category.
    static let general = Logger(subsystem: subsystem, category: "general")

    /// Logs the view change events such as when a view that appeared.
    static let viewCycle = Logger(subsystem: subsystem, category: "viewcycle")

    /// Logs related to data.
    static let dataStatus = Logger(subsystem: subsystem, category: "dataStatus")
}
