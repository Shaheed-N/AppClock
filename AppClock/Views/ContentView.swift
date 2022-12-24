//
//  ContentView.swift
//  ClockApp
//
//  Created by Shahid on 14.09.22.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
          AlarmView()
                .padding(.vertical , 5)

                .tabItem {
                    Image(systemName: "clock")
                    Text("Alarm")
                  
                }
          WorldView()
                .tabItem {
                    Image(systemName: "network")
                    Text("World")

                   
                }
            Text("")
                .tabItem {
                    Image(systemName: "3.square.fill")
                   
                }
        }
      
        .accentColor(Color("Color"))



        .padding(.vertical , 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
