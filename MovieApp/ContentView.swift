//
//  ContentView.swift
//  MovieApp
//
//  Created by Roberto De la O Pocasangre on 27/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text(R.string.localizable.homeTitle)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
