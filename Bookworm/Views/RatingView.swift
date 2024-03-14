//
//  RatingView.swift
//  Bookworm
//
//  Created by Robert DeLaurentis on 3/12/24.
//

import SwiftUI

/// View to display and adjust a book's rating
///
/// - parameter rating: Binding to an Int
/// - returns: Renders a Text view containing stars to represent the rating
struct RatingView: View {

    // MARK: - Properties

    @Binding var rating: Int

    var label = ""

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow

    // MARK: - Body View

    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
        }
        .buttonStyle(.plain)
    }

    // MARK: - Functions

    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }

}

// MARK: - Preview

#Preview(traits: .sizeThatFitsLayout) {
    RatingView(rating: .constant(4))
}
