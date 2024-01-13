//
//  SharedView.swift
//  hikerlogix
//
//  Created by Eric Corbett on 1/11/24.
//

import SwiftUI

struct MenuNavigationLink<Destination: View>: View {
    var imageName: String
    var text: String
    var destination: Destination

    init(imageName: String, text: String, destination: Destination) {
        self.imageName = imageName
        self.text = text
        self.destination = destination
    }

    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.black)
                Text(text)
                    .foregroundColor(.black)
            }
        }
        .padding()
    }
}
