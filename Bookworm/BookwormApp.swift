//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Robert DeLaurentis on 3/12/24.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
