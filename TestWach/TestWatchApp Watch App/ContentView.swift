//
//  ContentView.swift
//  TestWatchApp Watch App
//
//  Created by Adriel Bernard Rusli on 04/05/23.
//

import SwiftUI
import WatchConnectivity


struct ContentView: View {
    var body: some View {
        VStack {
            Button{
//                WatchConnectivityManager.shared.send("Hello World!\n\(Date().ISO8601Format())")
                WatchConnectivityManager.shared.send("callToAction")
                
            }label: {
                Text("Halo")
            }
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
