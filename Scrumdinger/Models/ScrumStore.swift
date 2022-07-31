//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Bohdan Pohorilets on 31.07.2022.
//

import Foundation
import SwiftUI

class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
            .appendingPathComponent("scrums.data")
    }
}
