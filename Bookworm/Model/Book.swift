//
//  Book.swift
//  Bookworm
//
//  Created by Robert DeLaurentis on 3/12/24.
//

import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int

    init(title: String, author: String, genre: String, review: String, rating: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
    }

    static let MockData = Book(title: "The Example", author: "The Author", genre: "Fiction", review: "This is an example data record", rating: 5)
}
