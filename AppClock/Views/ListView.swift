//
//  ListView.swift
//  ClockApp
//
//  Created by Shahid on 14.09.22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var dateManager: DateManager
    @State private var locations = ["06: 30" , "7:00"]
    @State private var toggle = false
    @State private var showSheet = false

    var width = UIScreen.main.bounds.width

    var body: some View {
       
       
        
        ZStack {
     
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 370, height: 320)
            .foregroundColor(.white)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(red: 0, green: 0, blue: 0, opacity: 0.24), lineWidth: 3);
                  

                List {
                VStack {
                    ForEach(locations, id: \.self) { location in
                        HStack {
                        Text(location)
                            Spacer()
   CustomToggle()
                        }
                        
                    
                    }
              
                
                }
                }
                .offset(x: 0, y: 50)
                .cornerRadius(20)
                .listStyle(.sidebar)
                ZStack {
                Rectangle()
                    .frame(width: 380, height: 4)
                    .foregroundColor(Color("Color"))
                    .offset(x: 0, y: -(width - 200) / 2)
                
                HStack {
                    Text("Alarm")
                    .fontWeight(.bold)
                    .font(.system(size: 27))
                    .foregroundColor(Color("Color"))
                    .position(x: 100, y: 65)
                    Button(action: {
                        
                    }) {
                             
                    Text("Edit")
                        .fontWeight(.bold)
                        .font(.system(size: 27))
                        .foregroundColor(Color("Color"))
                    }
                    .offset(x: -70, y: -94)
                    
                   
                    Button(action: {
                        showSheet = true
                    }) {
                        Text("+")
                        .fontWeight(.bold)
                        .font(.system(size: 35))
                        .foregroundColor(Color("Color"))
                    }
               
                           .sheet(isPresented: $showSheet,
                                  onDismiss: { print("dismissed!") },
                                  content: { ExampleSheet() })
                           .offset(x: -50, y: -94)
                }
                .offset(x: 0, y: -(width - 200) / 5 )
                   
            }
            }

    }
}
    }


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
class DateManager: ObservableObject {
    @Published var birthDate = Date()
}
struct ExampleSheet: View {
    @StateObject var dateManager = DateManager()



    @Environment(\.presentationMode) var presentationMode
    @State var rect: Bool = false
    @State var c: Bool = false
    @State var a: Bool = false
    @State var b: Bool = false


    
    var body: some View {
        
        ZStack {
        HStack {
         Button(action: {
            presentationMode.wrappedValue.dismiss()         })
            {
    Text("Cancel")
             .fontWeight(.bold)
             .font(.system(size: 25))
             .foregroundColor(Color("Color"))
         
         
         }
            
         .offset(x: -40, y: -330)
            
      Text("Add item")
          .fontWeight(.bold)
          .font(.system(size: 20))
          .foregroundColor(Color("Color"))
          .offset(x: -10, y: -330)
         
            
            Text("Done")
                .fontWeight(.bold)
                .font(.system(size: 25))
                .foregroundColor(Color("Color"))
                .offset(x: 30, y: -330)
            
       
         
                        
             }.padding(.horizontal , 60)
            DatePicker("", selection: $dateManager.birthDate , displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .clipped()
                .padding(.top , -200)
                .colorInvert()
        
                .colorMultiply(Color("Color"))

            Rectangle()
                .frame(width: 380, height: 4)
                .foregroundColor(Color("Color"))
                .offset(x: 0, y:20)
            Text("Repeat")
                .fontWeight(.bold)
                .font(.system(size: 25))
                .foregroundColor(Color("Color"))
                .offset(x: -120, y: 60)
CircleView()
                .offset(x: 0, y: 130)
            ZStack {
                
            RoundedRectangle(cornerRadius: 25)
            .fill(Color(red: 0.98, green: 0.98, blue: 0.98))
           
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(red: 0, green: 0, blue: 0, opacity: 0.24), lineWidth: 3))
            .shadow(radius: 4, y: 4)
                .frame(width: rect ?  343 : 0 , height: rect ? 190: 0 )
              
                Text(rect ? "Alert mode" : "")                    .foregroundColor( Color("Color"))
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .foregroundColor(Color("Color"))
                    .offset(x: 0, y: -75)

                 VStack {
                    HStack {
                        Text(rect ? "Vibrate" : "")                            .foregroundColor( Color("Color"))
                            .fontWeight(.bold)
                            .font(.system(size: 17))
                            .foregroundColor(Color("Color"))
                            .offset(x: -70, y: 100)
                        Circle()
                            .foregroundColor(a ? Color("Color") : .gray)
                            .opacity( rect ?  0.7 : 0.0)

                    .frame(width: 34, height: 36)
                    .offset(x: 87, y: 100)
                    .onTapGesture {
                        withAnimation {
                        self.a.toggle()
                        }
                    }
                    }
                    HStack {
                        Text(rect ? " Ring&Vibrate" : "")
                            .foregroundColor( Color("Color"))
                            .fontWeight(.bold)
                            .font(.system(size: 17))
                            .foregroundColor(Color("Color"))
                            .offset(x: -75, y: 10)

                        
                      
                        if a || c {
                            Circle()
                                .foregroundColor(.gray)
                              
                        
                            .opacity( rect ?  0.7 : 0.0)
                            .frame(width: 34, height: 36)
                            .offset(x: 60, y: 12)
                         
                        }
                        else {
                            Circle()
                                .opacity( rect ?  0.7 : 0.0)
                                .foregroundColor(b ? Color("Color") : .gray)
                    
                    .frame(width: 34, height: 36)
                    .offset(x: 60, y: 12)
    .onTapGesture {
                        withAnimation {
                        self.b.toggle()
                        }
                    }
                        }
                        
                    }
                    
                    HStack {
                        Text(rect ? "Ring" : "")
                            .foregroundColor( Color("Color"))
                            .fontWeight(.bold)
                            .font(.system(size: 17))
                            .foregroundColor(Color("Color"))
                            .offset(x: -78, y: -75)

                        if c  {
                            Circle()
                                .foregroundColor(Color("Color"))
                                .opacity( rect ?  0.7 : 0.0)

                        .frame(width: 34, height: 36)
                        .offset(x: 96, y: -76)
                            
                            
                        }
                        else if a || b {
                            Circle()
                                .fill(Color.gray)

                        .frame(width: 34, height: 36)
                        .offset(x: 96, y: -76)
                            }
                     
                            
                        
                        
                        else {
                        Circle()
                            .foregroundColor(c ? Color("Color") : .gray)
                            .opacity( rect ?  0.7 : 0.0)

                    .frame(width: 34, height: 36)
                    .offset(x: 96, y: -76)
         
                    .onTapGesture {
                        withAnimation() {
                        
                        self.c.toggle()
                        }
                           

                    }
                    .allowsTightening(false)
                        }
                        
                        
                    }
                }
            }

            VStack {
                HStack {
                    Text("Alert mode")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(Color("Color"))
                        .offset(x: 50, y: 220)


                    Spacer()
                
                   
                    
                        HStack {
                    Text("Ring")
                                .foregroundColor(.gray)
                    Image(systemName: "arrowtriangle.right.fill")
                        .foregroundColor(.gray)
                        .opacity(0.5)
                    }
                        .onTapGesture {
                            self.rect.toggle()

                        }
                        .offset(x: -20, y: 220)
                    

                }
                HStack {
                    Text("Ringtone")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(Color("Color"))
                        .offset(x: -33, y: 360)
                    Text("Default Ringtone")
                        .offset(x: 60, y: 360)

                    Image(systemName: "arrowtriangle.right.fill")
                        .offset(x: 65, y: 360)
                        .foregroundColor(.gray)
                        .opacity(0.5)
                }
                HStack {
                    Text("Snooze Time")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .offset(x: -45, y: 250)

                        .foregroundColor(Color("Color"))
                    Text("5 minutes")
                        .offset(x: 70, y: 250)

                    Image(systemName: "arrowtriangle.right.fill")
                        .foregroundColor(.gray)
                        .opacity(0.5)
                        .offset(x: 73, y: 250)

                }

            }


            
        }
        .environmentObject(dateManager)


    

        
    }
 
    
}
