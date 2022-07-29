//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Bohdan Pohorilets on 26.07.2022.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumView(scrums: $scrums)
            }
        }
    }
}
