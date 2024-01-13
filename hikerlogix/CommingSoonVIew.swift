//
//  CommingSoonVIew.swift
//  hikerlogix
//
//  Created by Eric Corbett on 1/7/24.
//

import SwiftUI

struct ComingSoonView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Content Coming Soon!")
                    .font(.title)
                    .padding()
            }
        }
    }
}

struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonView()
    }
}
