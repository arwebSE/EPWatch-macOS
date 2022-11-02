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
                RegionSettingsView(
                    regions: Region.allCases,
                    region: $state.region
                )
                .navigationTitle("Region")
            } label: {
                HStack {
                    Text("Region")
                    Spacer()
                    Text(state.region?.name ?? "")
                }
            }
            if let region = state.region {
                NavigationLink {
                    PriceAreaSettingsView(
                        priceAreas: region.priceAreas,
                        priceArea: $state.priceArea
                    )
                    .navigationTitle("Price area")
                } label: {
                    HStack {
                        Text("Price area")
                        Spacer()
                        Text(state.priceArea?.title ?? "")
                    }
                }
            }
            Section {
                NavigationLink {
                    SupportSettingsView()
                        .navigationTitle("Support")
                } label: {
                    Text("Support")
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
