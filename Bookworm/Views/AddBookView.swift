//
//  AddBookView.swift
//  Bookworm
//
//  Created by Robert DeLaurentis on 3/12/24.
//

import OSLog
import SwiftUI

struct AddBookView: View {

    // MARK: - Properties

    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""

    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]

    // MARK: - body View

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }

                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(newBook)
                        Logger.dataStatus.debug("Book added. title: \(newBook.title)")
                        Logger.dataStatus.debug("Book added. author: \(newBook.author)")
                        Logger.dataStatus.debug("Book added. genre: \(newBook.genre)")
                        Logger.dataStatus.debug("Book added. review: \(newBook.review)")
                        Logger.dataStatus.debug("Book added. rating: \(newBook.rating)")

                        dismiss()
                    }
                }
            }
            .onAppear(perform: { Logger.viewCycle.debug("AddBookView appeared") })
            .navigationTitle("Add Book")
        }
    } // end body
}

// MARK: - Preview

#Preview(traits: .sizeThatFitsLayout) {
    AddBookView()
}
