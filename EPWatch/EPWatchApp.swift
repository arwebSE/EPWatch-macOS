//
//  EPWatchApp.swift
//  EPWatch
//
//  Created by Jonas Bromö on 2022-09-16.
//  Modified by ARWeb on 2023-04-20.


import SwiftUI
import EPWatchCore

@main
struct EPWatchApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    
    init() {
#if DEBUG
        LogDebugInformation()
#endif
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(AppState.shared)
                .environmentObject(ShareLogsState.shared)
                .onAppear {
                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                    guard let window = windowScene.windows.first else { return }
                    window.setWindowStyle()
                }
        }
        
        .onChange(of: scenePhase) { phase in
            Log("Scene phase changed: \(scenePhase)")
            AppState.shared.isTimerRunning = (phase == .active)
        }
    }
}

extension UIWindow {
    func setWindowStyle() {
        self.windowScene?.sizeRestrictions?.minimumSize = CGSize(width: 400, height: 370)
        self.windowScene?.sizeRestrictions?.maximumSize = CGSize(width: 400, height: 370)
    }
}
