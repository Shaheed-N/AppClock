//
//  WorldView.swift
//  ClockApp
//
//  Created by Shahid on 15.09.22.
//

import SwiftUI


struct WorldView: View {
    var width = UIScreen.main.bounds.width
  

    @State private var showSheet = false

    var body: some View {
        let time = getTime()

        NavigationView {
            ZStack {

                VStack {
            Rectangle()
                
                    .foregroundColor(Color("Color"))
                .frame(width: 500, height: 3)
             
                    Spacer()
                    HStack {
                Text("Baku")
                        .fontWeight(.regular)
                        .opacity(0.5)
                        .font(.system(size: 35))
                       Spacer()
                Text(time)
                            .font(.system(size: 30))
                        
                            
                }                    .padding(.horizontal , 80)

                    Spacer()
                    .padding(.horizontal , 80)

                    Spacer()
                 
                    
                    
                }
                Text("")
         .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
            Text("World Clock")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .foregroundColor(Color("Color"))
        }
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                HStack(spacing: 30) {
            Text("Edit")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .foregroundColor(Color("Color"))
                    Button(action: {
                        showSheet = true
                    })
                    {
            Text("+")
                    .fontWeight(.bold)
                    .font(.system(size: 35))
                    .foregroundColor(Color("Color"))
                        
                        }
                   
                               .sheet(isPresented: $showSheet,
                                      onDismiss: { print("dismissed!") },
                                      content: { World() })
                }
        }
        }
        .navigationBarTitleDisplayMode(.inline)
        
    
        }
        }
       

    }
    func getTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())
        return dateString
    }
}

struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView()
    }
}
struct World: View {
 
    @State var text: String = ""

    var width = UIScreen.main.bounds.width

    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
          VStack {
                 HStack {
                     ZStack {
                     RoundedRectangle(cornerRadius: 25)
                     .fill(Color.white)
                     .frame(width: 266, height: 29)
                     .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color(red: 0, green: 0, blue: 0, opacity: 0.27), lineWidth: 3))
                         TextField("Search Cities", text: $text)
                             .padding(.leading ,50)
                             
                     }
                   
                     Button(action: {
                         presentationMode.wrappedValue.dismiss()         })
                     {
         Text("Cancel")
             .fontWeight(.bold)
             .font(.system(size: 25))
             .foregroundColor(Color("Color"))
             .padding(.trailing , 10)

                 }
             }
        Rectangle()
            
                .foregroundColor(Color("Color"))
            .frame(width: 500, height: 3)
         }
             .padding(.bottom , (width-200) / 0.35)

         }
        
    

}
        
