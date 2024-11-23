//
//  LocationView.swift
//  Weather
//
//  Created by Ciarán Mulholland on 23/11/2024.
//

import SwiftUI

struct LocationView: View {
    @EnvironmentObject var locationPresenter: LocationPresenter
    @State private var addressString: String = ""

    var body: some View {
        TextField("Address", text: $addressString)
            .onSubmit {
                locationPresenter.submit(addressString)
            }
            .textFieldStyle(.roundedBorder)
            .submitLabel(.search)
    }
}

#Preview {
    LocationView()
        .environmentObject(LocationPresenter(model: StaticAppModel()))
}
