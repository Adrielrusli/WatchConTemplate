//
//  ContentView.swift
//  TestWach
//
//  Created by Adriel Bernard Rusli on 04/05/23.
//

import SwiftUI
import WatchConnectivity




struct ContentView: View {
    @ObservedObject private var connectivityManager = WatchConnectivityManager.shared
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            Button{
                WatchConnectivityManager.shared.send("Test")
            }label: {
                Text("Test")
            }
            
            
        }
        .alert(item: $connectivityManager.notificationMessage) { message in
             Alert(title: Text(message.text),
                   dismissButton: .default(Text("Dismiss")))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
