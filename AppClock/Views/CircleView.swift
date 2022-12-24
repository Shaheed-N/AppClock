//
//  dfvfdv.swift
//  ClockApp
//
//  Created by Shahid on 15.09.22.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
          HStack {
                VStack {
            Circle()
                .foregroundColor(.gray)

        .frame(width: 37, height: 36)
                    Text("Mon")
                }
                VStack {
            Circle()
                .foregroundColor(.gray)

        .frame(width: 37, height: 36)
                    Text("Tue")
                }
                VStack {
            Circle()
                .foregroundColor(.gray)

        .frame(width: 37, height: 36)
                    Text("Wed")
                }
                VStack {
            Circle()
                .foregroundColor(.gray)

        .frame(width: 37, height: 36)
                    Text("Thur")
                }
                VStack {
            Circle()
                .foregroundColor(.gray)

        .frame(width: 37, height: 36)
                    Text("Fri")
                }
                VStack {
            Circle()
                .foregroundColor(.gray)

        .frame(width: 37, height: 36)
                    Text("Sat")
                }
                VStack {
            Circle()
                .foregroundColor(.gray)

        .frame(width: 37, height: 36)
                    Text("Sun")
                }
            }
        
        
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
