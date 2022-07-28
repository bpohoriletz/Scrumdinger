//
//  ScrumView.swift
//  Scrumdinger
//
//  Created by Bohdan Pohorilets on 28.07.2022.
//

import SwiftUI

struct ScrumView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        List {
            ForEach(scrums, id: \.title) { scrum in
                CardView(scrum: scrum)
                    .listRowBackground(scrum.theme.mainColor)
            }
        }
    }
}

struct ScrumView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumView(scrums: DailyScrum.sampleData)
    }
}
