//
//  LeaveNoTraceView.swift
//  hikerlogix
//
//  Created by Eric Corbett on 1/7/24.
//

import SwiftUI

struct LeaveNoTraceView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            Text("Content Coming Soon!")
                .font(.title)
                .padding()

            Button("Back to Main Menu") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}

struct LeaveNoTraceView_Previews: PreviewProvider {
    static var previews: some View {
        LeaveNoTraceView()
    }
}

