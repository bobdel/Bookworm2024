//
//  ContentView.swift
//  Bookworm
//
//  Created by Robert DeLaurentis on 3/12/24.
//

import SwiftData
import SwiftUI

/// Primary Screen on launch
struct ContentView: View {

    // MARK: - Properties

    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]

    @State private var showingAddScreen = false

    // MARK: - Body View

    var body: some View {
        NavigationStack {
            Text("Count: \(books.count)")
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Book", systemImage: "plus") {
                            showingAddScreen.toggle()
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
        }
    } // end body

}

// MARK: - Preview

#Preview {
    ContentView()
}
