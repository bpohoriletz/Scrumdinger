//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Bohdan Pohorilets on 26.07.2022.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumView(scrums: $store.scrums){
                    Task {
                        do {
                            try await ScrumStore.save(scrums: store.scrums)
                        } catch {
                            errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                        }
                    }
                }
            }.task{
                do {
                    store.scrums = try await ScrumStore.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.")
                }
            }.sheet(item: $errorWrapper, onDismiss: {
                store.scrums = DailyScrum.sampleData
            }){ wrapper in
                    ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
