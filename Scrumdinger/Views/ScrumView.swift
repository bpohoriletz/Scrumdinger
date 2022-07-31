//
//  ScrumView.swift
//  Scrumdinger
//
//  Created by Bohdan Pohorilets on 28.07.2022.
//

import SwiftUI

struct ScrumView: View {
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    @State private var newScrumData = DailyScrum.Data()
    let saveAction: ()->Void
    
    var body: some View {
        List {
            ForEach($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
        }
        .navigationTitle("Daily Scrums")
        .toolbar {
            Button(action:{
                isPresentingNewScrumView = true
            }) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")
        }
        .sheet(isPresented: $isPresentingNewScrumView){
            NavigationView{
                DetailEditView(data: $newScrumData)
                    .navigationTitle("Add Scrum")
                    .toolbar() {
                        ToolbarItem(placement: .confirmationAction){
                            Button("Add", action: {
                                isPresentingNewScrumView = false
                                let newScrum = DailyScrum(data: newScrumData)
                                scrums.append(newScrum)
                                newScrumData = DailyScrum.Data()
                            })
                        }
                        ToolbarItem(placement: .cancellationAction){
                            Button("Dismiss", action: {
                                isPresentingNewScrumView = false
                                newScrumData = DailyScrum.Data()
                            })
                        }
                    }
            }
        }
        .onChange(of: scenePhase){ phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct ScrumView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ScrumView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
        }
    }
}
