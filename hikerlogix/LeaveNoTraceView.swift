//
//  LeaveNoTraceView.swift
//  hikerlogix
//
//  Created by Eric Corbett on 1/7/24.
//

import SwiftUI

struct LeaveNoTraceView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Leave No Trace")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()

                Text("""
                     The Leave No Trace principles are guidelines to reduce the environmental impact while enjoying natural spaces. They are:
                     """)
                
                Text("1. Plan Ahead and Prepare")
                    .bold()
                    .font(.subheadline)
                
                Text("""
                     • Know the regulations and special concerns of the area.
                     • Prepare for extreme weather, hazards, and emergencies.
                     • Schedule trips to avoid high use times.
                     • Visit in small groups and repackage food to minimize waste.
                     • Use maps and compasses to reduce marking.
                     """)
                    .font(.subheadline)
                
                Text("2. Travel and Camp on Durable Surfaces")
                    .bold()
                    .font(.subheadline)
                
                Text("""
                     • Use maintained trails and designated campsites.
                     • Protect riparian areas by camping at least 200 feet from water sources.
                     • Concentrate use in popular areas and disperse in pristine ones.
                     """)
                    .font(.subheadline)

                Text("3. Dispose of Waste Properly")
                    .bold()
                    .font(.subheadline)
                
                Text("""
                     • Pack out all trash and leftover food.
                     • Utilize toilet facilities or catholes for human waste.
                     • Pack out toilet paper and hygiene products.
                     """)
                    .font(.subheadline)
                
                Text("4. Leave What You Find")
                    .bold()
                    .font(.subheadline)
                
                Text("""
                     • Preserve historical structures and artifacts.
                     • Leave natural objects as found and avoid transporting species.
                     """)
                    .font(.subheadline)

                Text("5. Minimize Campfire Impacts")
                    .bold()
                    .font(.subheadline)
                
                Text("""
                     • Use lightweight stoves and candle lanterns.
                     • Keep fires small and use established fire rings.
                     """)
                    .font(.subheadline)

                Text("6. Respect Wildlife")
                    .bold()
                    .font(.subheadline)
                
                Text("""
                     • Observe wildlife from a distance and never feed them.
                     • Store food and trash securely.
                     • Avoid wildlife during sensitive times.
                     """)
                    .font(.subheadline)
                
                Text("7. Be Considerate of Other Visitors")
                    .bold()
                    .font(.subheadline)
                
                Text("""
                     • Respect others and yield to other trail users.
                     • Keep noise levels down and camp away from trails.
                     """)
                    .padding([.bottom, .horizontal])
                    .font(.subheadline)

                Link("Learn more about Leave No Trace Principles", destination: URL(string: "https://www.nps.gov/articles/leave-no-trace-seven-principles.htm")!)
                    .foregroundColor(.blue)
            }
            .padding()
        }
        .navigationBarTitle("Leave No Trace", displayMode: .inline)
    }
}

struct LeaveNoTraceView_Previews: PreviewProvider {
    static var previews: some View {
        LeaveNoTraceView()
    }
}



