//
//  ErrorView.swift
//  Weather
//
//  Created by Ciarán Mulholland on 24/11/2024.
//
import SwiftUI

struct ErrorView: View {
    let errorMessage: String

    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle.fill")

            VStack(alignment: .leading) {
                Text("Something went wrong. Check your address and try again.")
                    .font(.headline)

                Divider()

                Text(errorMessage)
                    .font(.callout)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.yellow)
        )
    }
}


