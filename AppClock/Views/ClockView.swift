//
//  ClockView.swift
//  ClockApp
//
//  Created by Shahid on 14.09.22.
//

import SwiftUI

struct ClockView: View {
    @State var currentTime = Time(sec: 15, min: 10, hour: 10)
    var receiver = Timer.publish(every: 1, on: .current, in: .default)
        .autoconnect()
    
    var body: some View {
        VStack {
           
            clockFace(currentTime: $currentTime)
               
      
        }
        .onAppear(perform: {
            getTimeComponents()
        })
        .onReceive(receiver) { _ in
            getTimeComponents()
        }
    }
  
    
    private func getTimeComponents() {
        let calender = Calendar.current
        let sec = calender.component(.second, from: Date())
        let min = calender.component(.minute, from: Date())
        let hour = calender.component(.hour, from: Date())
        withAnimation(Animation.linear(duration: 0.01)) {
            currentTime = Time(sec: sec, min: min, hour: hour)
        }
    }
}

struct clockFace: View {
    
    @Binding var currentTime: Time
    var width = UIScreen.main.bounds.width
    var body: some View {
        ZStack {
            Circle()
              
                .strokeBorder(Color("Color") , lineWidth: 18)
                
            Circle()
                .frame(width: 40, height: 50)
       
                .foregroundColor(Color("Color-1"))
                .shadow(color: .black, radius: 40, x:1, y: 5)
     
            
            Rectangle()
                .fill(Color("Color"))
                .frame(width: 2, height: (width - 180) / 2)
                .offset(y: -(width - 2) / 5.2)
                .rotationEffect(.init(degrees: Double(currentTime.sec) * 6))
        
            Rectangle()
                .fill(Color("Color"))
                .frame(width: 3, height: (width - 200) / 2)
                .offset(y: -(width - 235) / 2.4)
                .rotationEffect(.init(degrees: Double(currentTime.min) * 6))
           
            Rectangle()
                .fill(Color("Color"))
                .opacity(0.5)
                .frame(width: 4.5, height: (width - 240) / 2)
                .offset(y: -(width - 289) / 2)
                .rotationEffect(.init(degrees: Double(currentTime.hour) * 30))
            Text("9")
                .font(.system(size: 25))
                .fontWeight(.bold)
            
                .foregroundColor(Color("Color"))
                .offset(x: -(width - 200) / 2)
         
            
            Text("3")
                .font(.system(size: 25))
                .fontWeight(.bold)
            
                .foregroundColor(Color("Color"))
                .offset(x: (width - 270) / 2, y:   (width - 320) / 2)

                
                .position(x:205, y: 120)
            Text("6")
                .font(.system(size: 25))
                .fontWeight(.bold)
            
                .foregroundColor(Color("Color"))
                
                .offset(x: 0, y: (width - 200) / 2  )
            Text("12")
                .font(.system(size: 25))
                .fontWeight(.bold)
            
                .foregroundColor(Color("Color"))
                
                .offset(x: 0, y: -(width - 200) / 2  )

           
        }
        .frame(width: width - 80, height: width - 80)
        Spacer()
    }
}

struct Time {
    var sec: Int
    var min: Int
    var hour: Int
}


struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}
