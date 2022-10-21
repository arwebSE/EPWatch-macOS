//
//  SettingsView.swift
//  EPWatchCore
//
//  Created by Jonas Bromö on 2022-09-16.
//

import SwiftUI
import EPWatchCore

struct SettingsView: View {

    @EnvironmentObject private var state: AppState
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        List {
            NavigationLink {
                PriceAreaSettingsView(
                    priceAreas: state.region.priceAreas,
                    priceArea: $state.priceArea
                )
                .navigationTitle("Price area")
            } label: {
                HStack {
                    Text("Price area")
                    Spacer()
                    Text(state.priceArea.title)
                }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button("Done") {
                    dismiss()
                }
            }
        }
    }

}