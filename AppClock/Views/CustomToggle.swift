//
//  CustomToggle.swift
//  ClockApp
//
//  Created by Shahid on 15.09.22.
//

import SwiftUI

struct CustomToggle: View {
    @State private var flag = true

    var body: some View {
        ZStack {
        Capsule()
                .frame(width: 90, height: 40)
                .foregroundColor(.white)
                .onTapGesture {
                  withAnimation {
                    self.flag.toggle()
                  }
                }
            Capsule()
                .stroke(lineWidth: 2)
                .frame(width: 90, height: 40)
                
          
            Circle()
                .foregroundColor(flag ? Color("Color") : .gray)
                .frame(width: 80, height: 35)
                .offset(x: flag ? -25 : 25)
                .onTapGesture {
                    withAnimation {
                    self.flag.toggle()
                }
                }
            
            }
        
        
        }
    }




struct CustomToggle_Previews: PreviewProvider {
    static var previews: some View {
        CustomToggle()
    }
}
