//
//  MapView.swift
//  Inquisitive
//
//  Created by Felicia Himawan on 23/06/24.
//

import SwiftUI

struct MapView: View {
    //buat ilangin animasi di NavigationLinl
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                //background map
                Image("Map/backgroundMap")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                
                // Use GeometryReader to get screen dimensions
                GeometryReader { geometry in
                    
                    //navigate to GLB
                    NavigationLink(destination: MaterialViewGLB()) {
                        VStack {
                            Image("Map/train")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width - 600)
                                .position(x: geometry.size.width * -0.1, y: geometry.size.height * 0.82)
                            
                            Text("Constant Velocity")
                                .font(.system(size: 32).bold())
                                .foregroundColor(Color(hex: "F4FAFB"))
                                .position(x: geometry.size.width * 0.12, y: geometry.size.height * 0.425)
                            
                        }
                        
                    }
                   
                    
                    
                   
                   
                }
                
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true) // Hide the navigation bar entirely
        .navigationBarBackButtonHidden(true) // Hide the back button specifically
        .edgesIgnoringSafeArea(.all) // Ignore safe area to take full screen
        
    }
    
}

#Preview {
    MapView()
}
