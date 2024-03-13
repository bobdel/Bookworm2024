//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Robert DeLaurentis on 3/13/24.
//

import SwiftUI

struct EmojiRatingView: View {

    // MARK: - Properties

    let rating: Int

    // MARK: - body View

    var body: some View {
        switch rating {
        case 1:
            Text("🤮")
        case 2:
            Text("🤕")
        case 3:
            Text("🤔")
        case 4:
            Text("😘")
        default:
            Text("🤩")
        }
    }
}

// MARK: - Preview

#Preview(traits: .sizeThatFitsLayout) {
    EmojiRatingView(rating: 3)
}
