//
//  NewLeaveNoTraceView.swift
//  hikerlogix
//
//  Created by Eric Corbett on 1/9/24.
//

import SwiftUI

struct LeaveNoTraceView: View {
    let principles = [
        ("checklist.checked", "1. Plan Ahead and Prepare", """
            • Know the regulations and special concerns of the area.
            • Prepare for extreme weather, hazards, and emergencies.
            • Schedule trips to avoid high use times.
            • Visit in small groups and repackage food to minimize waste.
            • Use maps and compasses to reduce marking.
            """),
        ("road.lanes", "2. Travel and Camp on Durable Surfaces", """
            • Use maintained trails and designated campsites.
            • Protect riparian areas by camping at least 200 feet from water sources.
            • Concentrate use in popular areas and disperse in pristine ones.
            """),
        ("trash", "3. Dispose of Waste Properly", """
            • Pack out all trash and leftover food.
            • Utilize toilet facilities or catholes for human waste.
            • Wash dishes 200 feet from water sources, use bio soap and strain food bits.
            """),
        ("photo", "4. Leave What You Find", """
            • Preserve historical structures and artifacts.
            • Leave natural objects as found and avoid transporting species.
            """),
        ("flame", "5. Minimize Campfire Impacts", """
            • Use lightweight stoves and candle lanterns.
            • Keep fires small and use established fire rings.
            """),
        ("lizard", "6. Respect Wildlife", """
            • Observe wildlife from a distance and never feed them.
            • Store food and trash securely.
            • Avoid wildlife during sensitive times.
            """),
        ("figure.2", "7. Be Considerate of Other Visitors", """
            • Respect others and yield to other trail users.
            • Keep noise levels down and camp away from trails.
            """)
    ]
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("LNT")
                        .font(.largeTitle)
                        .bold()
                    Link("Attribution: NPS Leave No Trace", destination: URL(string: "https://www.nps.gov/articles/leave-no-trace-seven-principles.htm")!)
                        .foregroundColor(.blue)
                    
                    ForEach(principles, id: \.1) { (icon, title, description) in
                        PrincipleView(icon: icon, title: title, description: description)
                    }
                }
                .padding()
            }
            .navigationBarTitle("Leave No Trace", displayMode: .inline)
            .background(BackgroundImage)
        }
    }
}

struct PrincipleView: View {
    var icon: String
    var title: String
    var description: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
                Text(title)
                    .bold()
                    .font(.subheadline)
            }
            Text(description)
                .font(.subheadline)
        }
        .padding()
    }
}

private var BackgroundImage: some View {
    Image("mainScreen")
        .resizable()
        .scaledToFill()
        .opacity(0.3)
}

struct LeaveNoTraceView_Previews: PreviewProvider {
    static var previews: some View {
        LeaveNoTraceView()
    }
}
