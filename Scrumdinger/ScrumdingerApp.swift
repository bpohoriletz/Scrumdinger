//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Bohdan Pohorilets on 26.07.2022.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumView(scrums: DailyScrum.sampleData)
        }
    }
}
