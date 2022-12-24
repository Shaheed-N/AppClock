//
//  AlarmView.swift
//  ClockApp
//
//  Created by Shahid on 14.09.22.
//

import SwiftUI

struct AlarmView: View  {
    @State private var toggle = false

    var body: some View {
        VStack {
       ClockView()
        ListView()
        }
    }

}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}
