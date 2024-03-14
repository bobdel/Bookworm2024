//
//  DetailView.swift
//  Bookworm
//
//  Created by Robert DeLaurentis on 3/13/24.
//

import SwiftData
import SwiftUI

struct DetailView: View {

    // MARK: - Properties

    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    @State private var showingDeleteAlert = false

    let book: Book

    // MARK: - body View

    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()

                Text(book.genre.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)

            Text(book.review)
                .padding()

            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
        }
        .toolbar {
            Button("Delete this book", systemImage: "trash") {
                showingDeleteAlert = true
            }
        }
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    } // end body

    // MARK: - Functions

    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
}

// MARK: - Preview

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test Book", author: "Test Author", genre: "Fantasy", review: "This was a great book; I really enjoyed it.", rating: 4)

        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
