//
//  Extension+Logger.swift
//
//  Created by Robert DeLaurentis on 3/13/24.
//  Last Modified on 10/4/24.
//  https://gist.github.com/bobdel/8baab707f7532fa61994a1718b96aa8f

///**
/// General purpose global logging and signpost configuration file
/// tested on Xcode 16, iOS 18, Swift 6 toolchain, and strict concurrency
///**

import OSLog // each file with a call site requires this import

// MARK: - Signposts

// Signposts send metadata to Instruments.
// To start Instruments Command-I in Xcode
// Select the Logging template
// and add the PointsOfInterest instrument

// MARK: - PointsOfInterest

/// A global log for the points of interest track
let pointsOfInterest = OSSignposter(
    subsystem: Bundle.main.bundleIdentifier!,
    category: OSLog.Category.pointsOfInterest
)

// PointsOfInterest generates a single data point in the trace
// Add as many as needed thoughout the app
// (events also apppear in the os_signpost instrument)
//
// call site example:
///** pointsOfInterest.emitEvent("Message", id: .exclusive)**

// MARK: - OSSignposter

/// A global log to record general signposts
let signposter = OSSignposter(
    subsystem: Bundle.main.bundleIdentifier!,
    category: "signposter"
)

// OSSignposter measures time intervals
// Time is only accurate with release builds on device
// Comparing times from simulator builds is useful
// for measuring relative changes between each run
// Each signpost uses a generated ID and matching name strings
// Begin and End Intervals accept unique string interpolation messages
//
// call site (3 lines):
///** let signpostID = signposter.makeSignpostID()**
///** let mySignpostState = signposter.beginInterval("Name (must match)", id: signpostID, "Start Message")**
//         <code to measure>
///** signposter.endInterval("Name (must match)", mySignpostState, "End Message")**


// MARK: - Logger

let defaultLogger = Logger()

// Logger output appears in console logs
// The logging system may redact some items for user privacy
//
///**Example call site: defaultLogger.log("Message String")**
// This example is a simple replacement for print() or NSLog()
//
// .log can be replaced by any of these levels, which adds filterable metadata
///** .notice, .debug, .info, .error, .log, .critical, .warning, .fault**

// MARK: - Logger Extension

// You can also create multiple logs with unique category metadata
//
///**Example call site: Logger.category.log("Message String")**
//
// .category can be replaced by general, viewCycle, or dataStatus
// .log can be replaced with any of the levels on line 70

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
