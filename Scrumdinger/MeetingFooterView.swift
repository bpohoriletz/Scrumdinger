//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Bohdan Pohorilets on 29.07.2022.
//

import SwiftUI

struct MeetingFooterView: View {
    var speakers: [ScrumTimer.Speaker]
    var skipAction: ()->Void
    
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last speaker")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Forward")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil}
        return index + 1
    }
    
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
