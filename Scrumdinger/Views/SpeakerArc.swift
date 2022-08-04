//
//  SpeakerArc.swift
//  Scrumdinger
//
//  Created by Bohdan Pohorilets on 04.08.2022.
//

import SwiftUI

struct SpeakerArc: Shape {
    let speakerIndex: Int
    let totalSpeakers: Int
    
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
    
    private var degreesPerSpeaker: Double {
        360 / Double(totalSpeakers)
    }
    
    private var startAngle: Angle {
        Angle(degrees: Double(speakerIndex) * degreesPerSpeaker + 1.0)
    }
    
    private var endAngle: Angle {
        Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1.0)
    }
}

struct SpeakerArc_Previews: PreviewProvider {
    static var previews: some View {
        SpeakerArc(speakerIndex: 0, totalSpeakers: 5)
    }
}

